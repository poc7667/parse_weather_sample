class RemoveLatitudeLongitudeToWeather < ActiveRecord::Migration
  def change
    remove_column :weather_logs, :latitude
    remove_column :weather_logs, :longitude
  end
end
