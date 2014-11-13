class RemoveLongLatToWeather < ActiveRecord::Migration
  def change
      remove_column :weather_logs, :lonlat
  end
end
