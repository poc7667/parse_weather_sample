class AddExtraColumnsToWeatherLog < ActiveRecord::Migration
  def change
    add_column :weather_logs, :report_type, :string
    add_column :weather_logs, :wban, :string
    add_column :weather_logs, :weather_station, :string
    add_column :weather_logs, :sea_level_pressure, :float
    add_column :weather_logs, :dew_point_temperature, :float
    add_column :weather_logs, :elevation, :float
    add_column :weather_logs, :visibility_distance, :float
    add_column :weather_logs, :precipitation_hour, :float
    add_column :weather_logs, :precipitation_depth_in_mm, :float
  end
end
