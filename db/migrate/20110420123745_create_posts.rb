class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :b_posts do |t|
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
  end

  def self.down
    drop_table :posts
  end
end
