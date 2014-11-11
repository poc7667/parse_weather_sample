json.array!(@weather_logs) do |weather_log|
  json.extract! weather_log, :id, :latitude, :longitude, :datatime, :air_temperature
  json.url weather_log_url(weather_log, format: :json)
end
