class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
    	t.string	:alias
    	t.string	:name
      t.string  :description
      t.integer :level
    	t.text		:settings
      t.timestamps
    end
    add_index :boards, :alias, unique: true

    INITIAL_BOARDS.each do |board|
      settings = {
        night:  false,
        zen:    false,
        files:  ['png', 'jpeg', 'gif']
      }
      settings[:zen]    = true if board[:alias]             == 'zen'
      settings[:night]  = true if board[:alias]             == 'n'
      settings[:files]  += ['mp3', 'ogg'] if board[:alias]  == 'mu'
      board[:settings]  = settings
      Board.create board
    end
  end

  def self.down
    drop_table :boards
  end
end
