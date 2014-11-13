class AddLatLongToWeatherLogs < ActiveRecord::Migration
  def change
    add_column :weather_logs, :latitude, :decimal, precision: 9, scale: 6
    add_column :weather_logs, :longitude, :decimal, precision: 9, scale: 6
  end
end
