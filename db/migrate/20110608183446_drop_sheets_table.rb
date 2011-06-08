class DropSheetsTable < ActiveRecord::Migration
  def self.up
    drop_table :sheets
    remove_column :assignments, :sheet_id
  end

  def self.down
  end
end
