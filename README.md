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