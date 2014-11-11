desc "Import Sample Weather"
namespace :import do
  task :sample_weather => :environment do
    sample_file = File.expand_path('../sample_weather.json', __FILE__)
    weather_logs = JSON.load(open(sample_file))
    weather_logs.each do |w_log|
      dt = Date.parse(w_log["datetime"])
      WeatherLog.create(
        latitude: w_log["latitude"].to_f,
        longitude: w_log["longitude"].to_f,
        air_temperature: w_log["air_temperature"].to_f,
        datetime: dt
      )
    end
  end
end
