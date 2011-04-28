class CreateRFiles < ActiveRecord::Migration
  def self.up
    create_table :r_files do |t|
    	t.string	:hash
    	t.string	:board
    	t.string	:name
      t.timestamps
    end
    add_index :r_files, [:hash, :board], unique: true
  end

  def self.down
    drop_table :r_files
  end
end
