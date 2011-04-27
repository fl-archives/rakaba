class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
    	t.string		:key
    	t.integer		:user_id
      t.timestamps
    end

    add_index :sessions, :key, unique: true
  end

  def self.down
    drop_table :sessions
  end
end
