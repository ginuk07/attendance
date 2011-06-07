class CreateClassifications < ActiveRecord::Migration
  def self.up
    create_table :classifications do |t|
      t.string :display_name
      t.string :name
      t.decimal :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :classifications
  end
end
