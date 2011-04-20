class CreateRThreads < ActiveRecord::Migration
  def self.up
    create_table :b_threads do |t|
    	t.text			:message
    	t.string		:title
    	t.string		:ip
    	t.integer		:_id
    	t.integer		:replies_count
    	t.integer		:author_id
    	t.integer		:board_id
    	t.boolean		:hidden
    	t.boolean		:sticky
    	t.datetime	:bump
      t.timestamps
    end
  end

  def self.down
    drop_table :r_threads
  end
end
