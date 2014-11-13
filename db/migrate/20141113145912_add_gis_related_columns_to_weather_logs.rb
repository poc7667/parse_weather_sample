class AddGisRelatedColumnsToWeatherLogs < ActiveRecord::Migration
  def change
    add_column :weather_logs, :lon, :point
    add_column :weather_logs, :lat, :point
    add_column :weather_logs, :lonlat, :point, :geographic => true
    add_index  :weather_logs, :lonlat, :spatial => true
  end
end
