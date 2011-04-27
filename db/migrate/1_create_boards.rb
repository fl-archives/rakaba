class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
    	t.string	:alias
    	t.string	:name
      t.string  :description
      t.integer :level
      t.integer :total_threads
    	t.text		:file_types
      t.timestamps
    end
    add_index :boards, :alias, unique: true

    INITIAL_BOARDS.each do |board|
      board[:file_types] = ['png', 'jpeg', 'gif']
      Board.create board
    end
  end

  def self.down
    drop_table :boards
  end
end
