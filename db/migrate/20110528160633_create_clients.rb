class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :previous_school
      t.date :admission_date
      t.references :attendance_sheet

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
