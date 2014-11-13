class RenameLatLonToLonlatToWeatherLogs < ActiveRecord::Migration
  def change
    rename_column :weather_logs, :lat_lon, :lonlat
  end
end
