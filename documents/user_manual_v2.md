# User Manual
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

Select data with some fields `temperature`, `sea_level_pressure` and  nearby `longitude=-71.05, latitude=42.35`

    http://<SERVER>/?location=-71.05,42.35

Select data with  all avaliable fields and  nearby `"Boston, MA, USA"`

    http://<SERVER>/?location=Boston,MA,USA

Select data with  all avaliable fields and  nearby `"Boston, MA, USA"` with start_time=`2014-03-03` and end_time=`2014-03-26`

    http://<SERVER>/?location=Boston,MA,USA&start_time=2014-03-03&end_time=2014-03-26

## Avaliable cities in database
		
* latitude:-34.15 longitude:19.9 city_name:["N2", "Overberg District Municipality", "Western Cape", "South Africa"]
* latitude:-33.5 longitude:21.283 city_name:["Bell Street", "Ladismith", "Ladismith", "South Cape DC", "Western Cape", "South Africa", "6655"]
* latitude:-33.3 longitude:23.483 city_name:["Suid Street", "Willowmore", "Willowmore", "Western District", "Eastern Cape", "South Africa", "6445"]
* latitude:-33.283 longitude:23.5 city_name:["8th Avenue", "Willowmore", "Willowmore", "Western District", "Eastern Cape", "South Africa", "6445"]
* latitude:-33.2 longitude:20.867 city_name:["8th Street", "Laingsburg", "Laingsburg", "Central Karoo DC", "Western Cape", "South Africa", "6900"]
* latitude:-33.05 longitude:25.717 city_name:["R400", "Western District", "Eastern Cape", "South Africa"]
* latitude:-32.2 longitude:24.55 city_name:["R61", "Graaff-Reinet", "Western District", "Eastern Cape", "South Africa"]
* latitude:-31.548 longitude:28.674 city_name:["R61", "Hairfield", "Transkei District", "Eastern Cape", "South Africa"]
* latitude:-31.533 longitude:28.667 city_name:["Unnamed Road", "Transkei District", "Eastern Cape", "South Africa"]
* latitude:-30.85 longitude:26.883 city_name:["N6", "Drakensberg District", "Eastern Cape", "South Africa"]
* latitude:-30.8 longitude:26.883 city_name:["N6", "Drakensberg District", "Eastern Cape", "South Africa"]
* latitude:-30.4 longitude:30.667 city_name:["Baker Street", "Sezela", "Ugu District Municipality", "KwaZulu-Natal", "South Africa", "4215"]
* latitude:-30.15 longitude:30.067 city_name:["R56", "Ixopo", "Ixopo", "East Griqualand", "KwaZulu-Natal", "South Africa", "3276"]
* latitude:-29.7 longitude:31.05 city_name:["Sugar Cane Road", "Flanders", "Blackburn", "Durban Metro", "KwaZulu-Natal", "South Africa", "4339"]
* latitude:-29.217 longitude:30.0 city_name:["R103", "Mooi River", "Mooi River", "Indlovu DC", "KwaZulu-Natal", "South Africa", "3300"]
* latitude:-26.2 longitude:28.45 city_name:["Lily Road", "Springs NU", "Springs", "East Rand", "Gauteng", "South Africa", "1559"]
* latitude:-25.983 longitude:28.133 city_name:["Old Pretoria Main Road", "Grand Central", "Midrand", "City of Johannesburg Metropolitan Municipality", "Gauteng", "South Africa", "1685"]
* latitude:-24.583 longitude:27.417 city_name:["14", "Sekelbos Street", "Thabazimbi", "Thabazimbi", "Bosveld", "Limpopo", "South Africa", "0387"]
* latitude:-23.867 longitude:29.45 city_name:["12", "Tin Street", "Polokwane Ext 8", "Polokwane", "Central", "Limpopo", "South Africa", "0700"]
* latitude:-23.845 longitude:29.459 city_name:["Veldspaat Street", "Central", "Limpopo", "South Africa"]
* latitude:-23.824 longitude:30.329 city_name:["R71", "Mopani", "Limpopo", "South Africa"]
* latitude:-23.6 longitude:28.383 city_name:["R518", "Bosveld", "Limpopo", "South Africa"]
* latitude:-22.55 longitude:45.4 city_name:["7", "Ranohira", "Ihosy", "Fianarantsoa", "Madagascar"]
* latitude:-22.058 longitude:27.829 city_name:["A15", "Selebi Phikwe", "Selebi-Phikwe", "Central", "Botswana"]
* latitude:-17.822 longitude:25.823 city_name:["Libala Drive", "Hillcrest", "Livingstone", "Livingstone", "Southern", "Zambia"]
* latitude:-17.817 longitude:25.817 city_name:["Libala Drive", "Hillcrest", "Livingstone", "Livingstone", "Southern", "Zambia"]
* latitude:-17.8 longitude:25.817 city_name:["Libala Drive", "Hillcrest", "Livingstone", "Livingstone", "Southern", "Zambia"]
* latitude:-17.633 longitude:48.5 city_name:["44", "Andreba", "Ambatondrazaka", "Toamasina", "Madagascar"]
* latitude:-15.683 longitude:34.967 city_name:["Unnamed Road", "Blantyre", "Southern Region", "Malawi"]
* latitude:-15.679 longitude:34.974 city_name:["Chileka Road", "Blantyre", "Blantyre", "Southern Region", "Malawi"]
* latitude:-15.317 longitude:28.45 city_name:["Great East", "Lusaka", "Lusaka", "Lusaka", "Zambia"]
* latitude:-12.917 longitude:34.267 city_name:["M18", "Nkhotakota", "Nkhotakota", "Central Region", "Malawi"]
* latitude:-11.9 longitude:31.433 city_name:["Unnamed Road", "Mpika", "Northern", "Zambia"]
* latitude:-10.339 longitude:40.182 city_name:["A 19", "Mtwara", "Mtwara", "Mtwara", "Tanzania"]
* latitude:-1.3 longitude:36.917 city_name:["Eldoret Drive", "Nyayo Estate", "Embakasi", "Nairobi", "Nairobi", "Kenya"]
* latitude:0.404 longitude:35.239 city_name:["Airport Path", "Eldoret International Airport", "Uasin Gishu", "Kenya"]
* latitude:1.543 longitude:11.581 city_name:["Oyem Airport", "Woleu", "Woleu-Ntem", "Gabon"]
* latitude:1.583 longitude:11.567 city_name:["N2", "Oyem", "Woleu", "Woleu-Ntem", "Gabon"]
* latitude:1.733 longitude:40.1 city_name:["Wajir Airport Runway", "Wajir Airport", "Wajir", "Wajir", "Kenya"]
* latitude:2.076 longitude:11.493 city_name:["N2", "Bitam", "Ntem", "Woleu-Ntem", "Gabon"]
* latitude:2.083 longitude:11.483 city_name:["Unnamed Road", "Bitam", "Ntem", "Woleu-Ntem", "Gabon"]
* latitude:2.25 longitude:32.9 city_name:["Lira-Kitgum Road", "Lira", "Lira", "Northern Region", "Uganda"]
* latitude:2.283 longitude:32.933 city_name:["Apala Road", "Lira", "Northern Region", "Uganda"]
* latitude:3.117 longitude:35.617 city_name:["Kapenguria - Lodwar Road", "Lodwar", "Turkana County", "Kenya"]
* latitude:6.517 longitude:101.283 city_name:["Unnamed Road", "Sateng Nok", "Mueang Yala District", "Yala", "Thailand", "95000"]
* latitude:6.933 longitude:122.067 city_name:["Gov. Ramos Ave.", "Zamboanga", "Zamboanga Sibugay", "Zamboanga Peninsula", "Philippines"]
* latitude:7.167 longitude:3.333 city_name:["Adedotun", "Abeokuta", "Ogun State", "Nigeria"]
* latitude:7.362 longitude:3.978 city_name:["Airport Road", "Ibadan", "Oyo", "Nigeria"]
* latitude:7.75 longitude:-2.1 city_name:["Unnamed Road", "Wenchi", "Wenchi", "Brong Ahafo", "Ghana"]
* latitude:7.817 longitude:-0.033 city_name:["Port lotniczy Kete-Krachi", "Krachi", "Volta", "Ghana"]
* latitude:8.667 longitude:3.383 city_name:["Sheik Tijani Street", "Shaki", "Oyo", "Nigeria"]
* latitude:9.15 longitude:92.817 city_name:["Unnamed Road", "Malacca", "Nicobar", "Andaman and Nicobar Islands", "India", "744301"]
* latitude:9.183 longitude:105.15 city_name:["54", "Lý Bôn", "Lâm Thành Mậu", "4", "Cà Mau", "Ca Mau", "Vietnam"]

		
	
## Avaliable longitude, latitude in Database

	
	   +----+----------+-----------+
	   | id | latitude | longitude |
	   +----+----------+-----------+
	   |    | -34.15   | 19.9      |
	   |    | -33.5    | 21.283    |
	   |    | -33.3    | 23.483    |
	   |    | -33.283  | 23.5      |
	   |    | -33.2    | 20.867    |
	   |    | -33.05   | 25.717    |
	   |    | -32.2    | 24.55     |
	   |    | -31.548  | 28.674    |
	   |    | -31.533  | 28.667    |
	   |    | -30.85   | 26.883    |
	   |    | -30.8    | 26.883    |
	   |    | -30.4    | 30.667    |
	   |    | -30.15   | 30.067    |
	   |    | -29.7    | 31.05     |
	   |    | -29.217  | 30.0      |
	   |    | -29.0    | 29.883    |
	   |    | -28.95   | 31.7      |
	   |    | -28.933  | 31.7      |
	   |    | -28.6    | 20.35     |
	   |    | -28.567  | 16.533    |
	   |    | -27.417  | 31.6      |
	   |    | -26.817  | 26.017    |
	   |    | -26.722  | 30.912    |
	   |    | -26.2    | 28.45     |
	   |    | -25.983  | 28.133    |
	   |    | -24.583  | 27.417    |
	   |    | -23.867  | 29.45     |
	   |    | -23.845  | 29.459    |
	   |    | -23.824  | 30.329    |
	   |    | -23.6    | 28.383    |
	   |    | -22.55   | 45.4      |
	   |    | -22.333  | 40.333    |
	   |    | -22.058  | 27.829    |
	   |    | -22.018  | 35.313    |
	   |    | -22.0    | 35.317    |
	   |    | -19.883  | 32.883    |
	   |    | -19.75   | 63.37     |
	   |    | -18.533  | 25.633    |
	   |    | -18.217  | 28.933    |
	   |    | -18.183  | 31.467    |
	   |    | -17.932  | 31.093    |
	   |    | -17.917  | 31.133    |
	   |    | -17.822  | 25.823    |
	   |    | -17.817  | 25.817    |
	   |    | -17.8    | 25.817    |
	   |    | -17.633  | 48.5      |
	   |    | -15.683  | 34.967    |
	   |    | -15.679  | 34.974    |
	   |    | -15.317  | 28.45     |
	   |    | -12.917  | 34.267    |
	   |    | -11.9    | 31.433    |
	   |    | -10.339  | 40.182    |
	   |    | -10.267  | 40.183    |
	   |    | -9.55    | 16.367    |
	   |    | -8.933   | 33.467    |
	   |    | -7.669   | 35.752    |
	   |    | -7.667   | 35.75     |
	   |    | -6.17    | 35.753    |
	   |    | -6.167   | 35.767    |
	   |    | -5.597   | 12.188    |
	   |    | -5.55    | 12.183    |
	   |    | -5.083   | 32.833    |
	   |    | -1.3     | 36.917    |
	   |    | 0.404    | 35.239    |
	   |    | 1.543    | 11.581    |
	   |    | 1.583    | 11.567    |
	   |    | 1.733    | 40.1      |
	   |    | 2.076    | 11.493    |
	   |    | 2.083    | 11.483    |
	   |    | 2.25     | 32.9      |
	   |    | 2.283    | 32.933    |
	   |    | 3.117    | 35.617    |
	   |    | 3.122    | 35.609    |
	   |    | 4.747    | -6.661    |
	   |    | 4.75     | -6.65     |
	   |    | 5.333    | 39.567    |
	   |    | 6.33     | 99.729    |
	   |    | 6.467    | 7.55      |
	   |    | 6.474    | 7.562     |
	   |    | 6.516    | 101.283   |
	   |    | 6.517    | 101.283   |
	   |    | 6.933    | 122.067   |
	   |    | 7.167    | 3.333     |
	   |    | 7.362    | 3.978     |
	   |    | 7.75     | -2.1      |
	   |    | 7.817    | -0.033    |
	   |    | 8.017    | 110.617   |
	   |    | 8.667    | 3.383     |
	   |    | 9.15     | 92.817    |
	   |    | 9.183    | 105.15    |
	   |    | 9.267    | 79.3      |
	   |    | 9.617    | 6.533     |
	   |    | 9.652    | 6.462     |
	   |    | 9.767    | 1.091     |
	   |    | 9.767    | 1.1       |
	   |    | 9.778    | 98.585    |
	   |    | 9.983    | 98.617    |
	   |    | 10.05    | -2.5      |
	   |    | 10.38    | 114.37    |
	   +----+----------+-----------+