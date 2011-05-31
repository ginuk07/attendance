class CreateAttendanceSheets < ActiveRecord::Migration
  def self.up
    create_table :attendance_sheets do |t|
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :attendance_sheets
  end
end
