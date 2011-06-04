class AddNameIndexToClients < ActiveRecord::Migration
  def self.up
    add_index :clients, :name, :name => "name_index", :unique => true
  end

  def self.down
    remove_index :clients, :name => "name_index"
  end
end
