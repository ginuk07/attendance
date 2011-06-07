class AddClassificationToClients < ActiveRecord::Migration
  def self.up
    change_table :clients do |t|
      t.references :classification
    end
  end

  def self.down
    remove_column :clients, :classification_id
  end
end
