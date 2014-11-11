class CreateWeatherLogs < ActiveRecord::Migration
  def change
    create_table :weather_logs do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :datatime
      t.float :air_temperature

      t.timestamps
    end
  end
end
