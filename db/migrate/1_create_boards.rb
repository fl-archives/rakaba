class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
    	t.string	:alias
    	t.string	:name
      t.string  :description
    	t.text		:settings
      t.timestamps
    end

    INITIAL_BOARDS.each_pair do |pair|
      Board.create alias: pair[0], name: pair[1], settings: Hash.new
    end
  end

  def self.down
    drop_table :boards
  end
end
