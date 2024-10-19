CREATE TABLE IF NOT EXISTS fact_weather (
    ID SERIAL PRIMARY KEY,
    lat DOUBLE PRECISION NOT NULL,
    lon DOUBLE PRECISION NOT NULL
);

CREATE TABLE IF NOT EXISTS current_weather (
    current_id SERIAL PRIMARY KEY,
    dt BIGINT NOT NULL,
    uvi DOUBLE PRECISION NOT NULL,
    temp DOUBLE PRECISION NOT NULL,
    clouds INT NOT NULL,
    sunset BIGINT NOT NULL,
    sunrise BIGINT NOT NULL,
    humidity INT NOT NULL,
    pressure INT NOT NULL,
    wind_deg INT NOT NULL,
    dew_point DOUBLE PRECISION NOT NULL,
	wind_gust DOUBLE PRECISION NOT NULL,
    feels_like DOUBLE PRECISION NOT NULL,
    visibility INT NOT NULL,
    wind_speed DOUBLE PRECISION NOT NULL,
    weather_id INT NOT NULL,
    weather_icon VARCHAR(50) NOT NULL,
    weather_main VARCHAR(50) NOT NULL,
    weather_description TEXT NOT NULL,
    fact_id INT REFERENCES fact_weather(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS daily_weather (
    daily_id SERIAL PRIMARY KEY,
    dt BIGINT NOT NULL,
    pop DOUBLE PRECISION NOT NULL,
    uvi DOUBLE PRECISION NOT NULL,
    rain DOUBLE PRECISION,
    clouds INT NOT NULL,
    sunset BIGINT NOT NULL,
    moonset BIGINT NOT NULL,
    summary TEXT NOT NULL,
    sunrise BIGINT NOT NULL,
    humidity INT NOT NULL,
    moonrise BIGINT NOT NULL,
    pressure INT NOT NULL,
    wind_deg INT NOT NULL,
    dew_point DOUBLE PRECISION NOT NULL,
    wind_gust DOUBLE PRECISION NOT NULL,
    moon_phase DOUBLE PRECISION NOT NULL,
    wind_speed DOUBLE PRECISION NOT NULL,
    temp_day DOUBLE PRECISION NOT NULL,
    temp_eve DOUBLE PRECISION NOT NULL,
    temp_max DOUBLE PRECISION NOT NULL,
    temp_min DOUBLE PRECISION NOT NULL,
    temp_morn DOUBLE PRECISION NOT NULL,
    temp_night DOUBLE PRECISION NOT NULL,
    feels_like_day DOUBLE PRECISION NOT NULL,
    feels_like_eve DOUBLE PRECISION NOT NULL,
    feels_like_morn DOUBLE PRECISION NOT NULL,
    feels_like_night DOUBLE PRECISION NOT NULL,
    weather_id INT NOT NULL,
    weather_icon VARCHAR(50) NOT NULL,
    weather_main VARCHAR(50) NOT NULL,
    weather_description TEXT NOT NULL,
    fact_id INT REFERENCES fact_weather(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS hourly_weather (
    hourly_id SERIAL PRIMARY KEY,
    dt BIGINT NOT NULL,
    pop DOUBLE PRECISION NOT NULL,
    uvi DOUBLE PRECISION NOT NULL,
    temp DOUBLE PRECISION NOT NULL,
    clouds INT NOT NULL,
    humidity INT NOT NULL,
    pressure INT NOT NULL,
    wind_deg INT NOT NULL,
    dew_point DOUBLE PRECISION NOT NULL,
    wind_gust DOUBLE PRECISION NOT NULL,
    feels_like DOUBLE PRECISION NOT NULL,
    visibility INT NOT NULL,
    wind_speed DOUBLE PRECISION NOT NULL,
    rain_1h DOUBLE PRECISION,
    weather_id INT NOT NULL,
    weather_icon VARCHAR(50) NOT NULL,
    weather_main VARCHAR(50) NOT NULL,
    weather_description TEXT NOT NULL,
    fact_id INT REFERENCES fact_weather(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS minutely_weather (
    minutely_id SERIAL PRIMARY KEY,
    dt BIGINT NOT NULL,
    precipitation INT NOT NULL,
    fact_id INT REFERENCES fact_weather(ID) ON DELETE CASCADE
);
