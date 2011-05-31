class CreateAttendanceValues < ActiveRecord::Migration
  def self.up
    create_table :attendance_values do |t|
      t.references :client
      t.references :attendance_sheet
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :attendance_values
  end
end
