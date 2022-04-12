class AddAttendanceCountToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :attendance_count, :bigint, :null => false, :default => 0
  end
end
