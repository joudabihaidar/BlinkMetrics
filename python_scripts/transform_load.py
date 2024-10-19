import psycopg2
import pandas as pd
import json
from psycopg2 import sql
import os


#####################
# Utility Functions #
#####################


# Connecting to PostgreSQL database
def connect_db(dbname):
    """
    Connects to the PostgreSQL database.
    Returns a connection object if successful, or None if connection fails.
    """
    try:
        conn = psycopg2.connect(
            dbname=os.getenv('DB_NAME', dbname),
            user=os.getenv('DB_USER', 'postgres'),
            password=os.getenv('DB_PASSWORD'),
            host=os.getenv('DB_HOST', 'localhost'),
            port=os.getenv('DB_PORT', 5432)
        )
        return conn
    except Exception as error:
        return None
    
# Function to get data from PostgreSQL and load into a pandas DataFrame
def get_data_from_db(query,dbname):
    """
    Fetches data from the PostgreSQL database using the provided query.
    Cleans column names and returns the data as a pandas DataFrame.
    """
    conn = connect_db(dbname)
    if conn is None:
        return None
    
    try:
        df = pd.read_sql_query(query, conn)
        return df
    except Exception as error:
        return None
    finally:
        conn.close()

# Function to flatten JSON and handle nested dictionaries/lists
def flatten_json(data):
    # Normalize the main data
    flat_data = pd.json_normalize(data)
    
    # Checking for columns with lists of dictionaries and expanding them
    for column in flat_data.columns:
        if isinstance(flat_data[column].iloc[0], list): # checking if the column includes lists
            # Normalizing the list of dictionaries into separate columns
            nested_data = pd.json_normalize(flat_data[column].explode())
            nested_data.columns = [f"{column}.{sub_col}" for sub_col in nested_data.columns]  # Renaming the columns
            flat_data = flat_data.drop(columns=[column]).join(nested_data)  # joining the expanded data
    return flat_data

# Replace dots with underscores in column names
def replace_dots_in_column_names(df):
    df.columns = df.columns.str.replace('.', '_', regex=False)
    return df


def insert_dynamic_data(conn, table_name, df):
    with conn.cursor() as cursor:
        columns = ', '.join(df.columns)
        placeholders = ', '.join(['%s' for _ in df.columns])
        query = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
        
        # Convert DataFrame to list of tuples for batch insertion
        values = [tuple(row.astype(object).values) for _, row in df.iterrows()]
        cursor.executemany(query, values)  # Batch insert
    conn.commit()


#####################
# Loading Functions #
#####################


# Example to load fact_weather
def load_fact_weather(conn, fact_df):
    insert_dynamic_data(conn, 'fact_weather', fact_df)

# Example to load current_weather
def load_current_weather(conn, current_df):
    insert_dynamic_data(conn, 'current_weather', current_df)

# Example to load daily_weather
def load_daily_weather(conn, daily_df):
    insert_dynamic_data(conn, 'daily_weather', daily_df)

# Example to load hourly_weather
def load_hourly_weather(conn, hourly_df):
    insert_dynamic_data(conn, 'hourly_weather', hourly_df)

# Example to load minutely_weather
def load_minutely_weather(conn, minutely_df):
    insert_dynamic_data(conn, 'minutely_weather', minutely_df)



df=get_data_from_db("SELECT * FROM onecall",'open_weather')


#########################
# Transforming the data #
#########################


# We will be splitting our staging table into several tables to meet our schema design
# (current_weather table, daily_weather table, hourly_weather table and minutely_weather table)

df=get_data_from_db("SELECT * FROM onecall",'open_weather')

fact_table = pd.DataFrame()
fact_table['lat'] = df['lat']
fact_table['lon'] = df['lon']
# Generate incremental IDs for the fact table
fact_table['ID'] = range(1, len(fact_table) + 1)
# Reordering columns to bring the ID at the beginning
fact_table = fact_table[['ID'] + [col for col in fact_table.columns if col != 'ID']]

current_data = df['current'][0]
current_df = flatten_json(current_data)
current_df['fact_id'] = fact_table['ID'][0]  # Linking to the fact table
current_df['current_id'] = range(1, len(current_df) + 1)  # Adding incremental ID for current weather
current_df = current_df.drop(columns=['lat', 'lon'], errors='ignore')
# Reordering columns to bring the ID at the beginning
current_df = current_df[['current_id'] + [col for col in current_df.columns if col != 'current_id']]
current_df = replace_dots_in_column_names(current_df)

# Extract and flatten daily weather data
daily_data = df['daily'][0]
daily_df = flatten_json(daily_data)
daily_df['fact_id'] = fact_table['ID'][0]  # Linking to the fact table
daily_df['daily_id'] = range(1, len(daily_df) + 1)  # Adding incremental ID for daily weather
daily_df = daily_df.drop(columns=['lat', 'lon'], errors='ignore')
# Reordering columns to bring the ID at the beginning
daily_df = daily_df[['daily_id'] + [col for col in daily_df.columns if col != 'daily_id']]
daily_df = replace_dots_in_column_names(daily_df)

# Extract and flatten hourly weather data
hourly_data = df['hourly'][0]
hourly_df = flatten_json(hourly_data)
hourly_df['fact_id'] = fact_table['ID'][0]  # Linking to the fact table
hourly_df['hourly_id'] = range(1, len(hourly_df) + 1)  # Adding incremental ID for hourly weather
hourly_df = hourly_df.drop(columns=['lat', 'lon'], errors='ignore')
# Reordering columns to bring the ID at the beginning
hourly_df = hourly_df[['hourly_id'] + [col for col in hourly_df.columns if col != 'hourly_id']]
hourly_df = replace_dots_in_column_names(hourly_df)

# Extract and flatten minutely weather data
minutely_data = df['minutely'][0]
minutely_df = flatten_json(minutely_data)
minutely_df['fact_id'] = fact_table['ID'][0]  # Linking to the fact table
minutely_df['minutely_id'] = range(1, len(minutely_df) + 1)  # Adding incremental ID for minutely weather
minutely_df = minutely_df.drop(columns=['lat', 'lon'], errors='ignore')
# Reordering columns to bring the ID at the beginning
minutely_df = minutely_df[['minutely_id'] + [col for col in minutely_df.columns if col != 'minutely_id']]
minutely_df_df = replace_dots_in_column_names(minutely_df)


####################
# Loading the data #
####################


conn = connect_db('weather_dwh') 
load_fact_weather(conn, fact_table)
load_current_weather(conn, current_df)
load_daily_weather(conn, daily_df)
load_hourly_weather(conn, hourly_df)
load_minutely_weather(conn, minutely_df)

conn.close()  