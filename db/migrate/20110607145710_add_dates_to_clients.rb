class AddDatesToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :discharge_date, :date
    add_column :clients, :iep_date, :date
  end

  def self.down
    remove_column :clients, :iep_date
    remove_column :clients, :discharge_date
  end
end
