json.array!(@weather_logs) do |weather_log|
  json.extract! weather_log, :latitude, :longitude, :datetime, :air_temperature
end
