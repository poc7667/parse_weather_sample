
## Supported Fields

    * datetime
    * air_temperature
    * report_type
    * wban
    * weather_station
    * sea_level_pressure
    * dew_point_temperature
    * elevation
    * visibility_distance
    * precipitation_hour
    * precipitation_depth_in_mm
    * latitude
    * longitud

## Usage

location's value should be separated by `common`
You can give a `city name` or  `longitude, latitude`

    location=Boston, MA, USA
    location=-71.05,42.35

## Example

Select data with fields `temperature`, `sea_level_pressure` and  nearby `"Boston, MA, USA"`

    http://<SERVER>/?location=Boston,MA,USA&fields=air_temperature,weather_station

Select data with fields `temperature`, `sea_level_pressure` and  nearby `longitude=-71.05, latitude=42.35`

    http://<SERVER>/?location=-71.05,42.35

Select data with  all avaliable fields and  nearby `"Boston, MA, USA"`

    http://<SERVER>/?location=Boston,MA,USA

Select data with  all avaliable fields and  nearby `"Boston, MA, USA"` with start_time=`2014-03-03` and end_time=`2014-03-26`

    http://<SERVER>/?location=Boston,MA,USA&start_time=2014-03-03&end_time=2014-03-26
