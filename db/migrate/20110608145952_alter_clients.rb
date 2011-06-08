class AlterClients < ActiveRecord::Migration
  def self.up
    remove_column :clients, :previous_school
    add_column :clients, :school_id, :integer
  end

  def self.down
    remove_column :clients, :school_id
    add_column :clients, :previous_school, :string
  end
end
