class RenameColumnDatatimeToWeatherLogs < ActiveRecord::Migration
  def change
      rename_column :weather_logs, :datatime, :datetime
  end
end
