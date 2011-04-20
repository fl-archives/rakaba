class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
    	t.string	:alias
    	t.string	:name
    	t.text		:settings
      t.timestamps
    end
  end

  def self.down
    drop_table :boards
  end
end
