class RemoveWrongLatLonTypeToWeatherLogs < ActiveRecord::Migration
  def change
    remove_column :weather_logs, :lat
    remove_column :weather_logs, :lon
    add_column :weather_logs, :latitude, :float
    add_column :weather_logs, :longitude, :float
  end
end
