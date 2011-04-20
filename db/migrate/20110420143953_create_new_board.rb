class CreateNewBoard < ActiveRecord::Migration
  def self.up
  	create_table :dev_posts do |t|
    	t.text			:message
    	t.string		:title
    	t.string		:ip
    	t.integer		:_id
    	t.integer		:author_id
    	t.integer		:thread_id
    	t.boolean		:hidden
    	t.boolean		:sage
      t.timestamps
    end

    create_table :dev_threads do |t|
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
  end
end
