<<<<<<< HEAD
# Select weather data 

For demo use,

One query will return at most  200 records.

And only support 4 attributes (latitude, longitude, datetime, air_temperature) for each record.
	  
	  {
	  latitude: 40.695,
	  longitude: -96.854,
	  datetime: "2014-01-01T00:00:00.000Z",
	  air_temperature: -3
	  },
	  {
	  latitude: 40.695,
	  longitude: -96.854,
	  datetime: "2014-01-01T00:00:00.000Z",
	  air_temperature: -3
	  },

## Given start_time and end_time 

Get data between an interval

* http://<SERVER_URL>:3000/?start_time=2014-01-04&end_time=2014-01-08

## Given start_time

Get data  from  the given start_time to the lastest time

* http://<SERVER_URL>:3000/?start_time=2014-01-04

## Given end_time

Get data from the earliest time to the given end_time

* http://<SERVER_URL>:3000/?end_time=2014-01-09

## Filter attributes

`datetime` is a required attribute, you don't need to specify it.

Specify attributes for query, eg: `latitude` or `longitude` or ...

These arrtibutes should be separated by common `,`

`http://<SERVER_URL>:3000/?start_time=2014-01-04&attributes=latitude,longitude
`
  
  
    {
    latitude: 40.695,
    longitude: -96.854,
    datetime: "2014-01-01T00:00:00.000Z"
    }
=======
## Dataflow

1. Fetch data from FTP
2. Parse data by python, convert raw data into json file
3. Feed json file to Rails with a rake file

# 2014-11-13

## Fetch more data from NOAA （done）

1. Write a script can fetch source data easier

## Parse more information and add more column into DB (done)

目前資料庫有以下的欄位資訊

                    :datetime => :datetime,
              :air_temperature => :float,
                  :report_type => :string,
                         :wban => :string,
              :weather_station => :string,
           :sea_level_pressure => :float,
        :dew_point_temperature => :float,
                    :elevation => :float,
          :visibility_distance => :float,
           :precipitation_hour => :float,
    :precipitation_depth_in_mm => :float,
                     :latitude => :string,
                    :longitude => :string,


## Enable database with GIS module (done)

目的: 讓搜尋經緯度相關資訊能夠更快得到資料。

## Add API interface (TODO)

增加 API,讓使用者可以透過參數拿到資料
	
	* 地理位置(城市名稱 or 經緯度)
	* sample_rate
	* begin_time
	* end_time
	* fields
	
# Bug

        
            'HR_TIME':  # YYYYMMDDHH
            'HR':    # GREENWICH MEAN TIME HOUR
            'MN':    # GREENWICH MEAN TIME MINUTES 
            'DIR':   # WIND DIRECTION IN COMPASS DEGREES, 990 = VARIABLE, REPORTED AS '***' WHEN AIR IS CALM (SPD WILL THEN BE 000)
            'SPD':   # WIND SPEED IN MILES PER HOUR 
            'GUS':   # GUST IN MILES PER HOUR 
            'CLG':   # CLOUD CEILING--LOWEST OPAQUE LAYER WITH 5/8 OR GREATER COVERAGE, IN HUNDREDS OF FEET, 722 = UNLIMITED 
            'SKC':   # SKY COVER -- CLR-CLEAR, SCT-SCATTERED-1/8 TO 4/8, BKN-BROKEN-5/8 TO 7/8, OVC-OVERCAST, OBS-OBSCURED, POB-PARTIAL OBSCURATION
            'L':     # LOW CLOUD TYPE
            'M':     # MEDIUM CLOUD TYPE
            'H':     # HIGH CLOUD TYPE
            'VSB':   # VISIBILITY IN STATUTE MILES TO NEAREST TENTH
            'MW1':   # MANUALLY OBSERVED PRESENT WEATHER (see table on website listed above for detail)
            'MW2':   #
            'MW3':   #
            'MW4':   #
            'AW1':   # AUTO-OBSERVED PRESENT WEATHER (see table on website listed above for detail)
            'AW2':   #
            'AW3':   #
            'AW4':   #
            'W':     # PAST WEATHER INDICATOR
            'TEMP':  # TEMPERATURE IN FARENHEIT
            'DEWP':  # DEWPOINT IN FARENHEIT
            'SLP':   # SEA LEVEL PRESSURE IN MILLIBARS TO NEAREST TENTH
            'ALT':   # ALTIMETER SETTING IN INCHES TO NEAREST HUNDREDTH
            'STP':   # STATION PRESSURE IN MILLIBARS TO NEAREST TENTH
            'MAX':   # MAXIMUM TEMPERATURE IN FAHRENHEIT (TIME PERIOD VARIES)
            'MIN':   # MINIMUM TEMPERATURE IN FAHRENHEIT (TIME PERIOD VARIES)
            'PCP01': # 1-HOUR LIQUID PRECIP REPORT IN INCHES AND HUNDREDTHS -- THAT IS, THE PRECIP FOR THE PRECEDING 1 HOUR PERIOD
            'PCP06': # 6-HOUR LIQUID PRECIP REPORT IN INCHES AND HUNDREDTHS -- THAT IS, THE PRECIP FOR THE PRECEDING 6 HOUR PERIOD
            'PCP24': # 24-HOUR LIQUID PRECIP REPORT IN INCHES AND HUNDREDTHS -- THAT IS, THE PRECIP FOR THE PRECEDING 24 HOUR PERIOD
            'PCPXX': # LIQUID PRECIP REPORT IN INCHES AND HUNDREDTHS, FOR A PERIOD OTHER THAN 1, 6, OR 24 HOURS (USUALLY FOR 12 HOUR PERIOD FOR STATIONS OUTSIDE THE U.S., AND FOR 3 HOUR PERIOD FOR THE U.S.) T = TRACE FOR ANY PRECIP FIELD
            'SD':    # SNOW DEPTH IN INCHES

	
>>>>>>> release/v.13
