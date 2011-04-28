class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
    	t.string	:alias
    	t.string	:name
      t.integer :level
      t.integer :total_threads
    	t.text		:settings
      t.timestamps
    end
    add_index :boards, :alias, unique: true

    INITIAL_BOARDS.each do |board|
      board[:settings] = {
        max_file_size:      5.megabytes,
        allowed_file_types: ['image/png', 'image/jpeg', 'image/gif'],
      }
      Board.create board
    end
  end

  def self.down
    drop_table :boards
  end
end
