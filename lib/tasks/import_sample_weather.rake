desc "Import Sample Weather"
namespace :import do
  task :sample_weather => :environment do
    def import_sample_file(sample_file)
      weather_logs = JSON.load(open(sample_file))
      weather_logs.each do |w_log|
        dt = Date.parse(w_log["datetime"])

        log = WeatherLog.new(
          longitude: w_log["longitude"].to_f,
          latitude: w_log["latitude"].to_f,
          air_temperature: w_log["air_temperature"].to_f,
          datetime: dt,
        )
        log.lonlat = "POINT(#{log.longitude} #{log.latitude})"
        ["report_type","wban", "weather_station"].each do |attr|
          log.send("#{attr}=", w_log[attr].to_s)
        end
        ["sea_level_pressure","dew_point_temperature", "elevation",
         "visibility_distance", "precipitation_hour", "precipitation_depth_in_mm"].each do | attr |
          log.send("#{attr}=", w_log[attr].to_f)
         end
        log.save
      end
    end #end import_sample_file

    ["2014"].each do |year|
      folder = File.expand_path("../#{year}", __FILE__)
      Dir["#{folder}/*.json"].each do |sample_file|
        import_sample_file(sample_file)
      end
    end


  end
end