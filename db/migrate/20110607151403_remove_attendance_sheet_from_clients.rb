class RemoveAttendanceSheetFromClients < ActiveRecord::Migration
  def self.up
    remove_column :clients, :attendance_sheet_id
  end

  def self.down
    add_column :clients, :attendance_sheet_id
  end
end
