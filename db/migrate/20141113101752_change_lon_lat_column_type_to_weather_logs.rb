class ChangeLonLatColumnTypeToWeatherLogs < ActiveRecord::Migration
  def change
    remove_column :weather_logs, :latitude
    remove_column :weather_logs, :longitude
    add_column :weather_logs, :latitude, :point
    add_column :weather_logs, :longitude, :point
    add_column :weather_logs, :lat_lon, :point, :geographic => true
    add_reference :weather_logs, :lonlat, index: true, :spatial => true
  end
end
