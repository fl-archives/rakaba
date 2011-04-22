class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :b_posts do |t|
    	t.text			:message
    	t.string		:ip
    	t.integer		:_id
    	t.integer		:author_id
    	t.integer		:thread_id
    	t.boolean		:hidden, default: false
    	t.boolean		:sage, default: false
      t.string    :file_file_name
      t.string    :file_content_type
      t.integer   :file_file_size
      t.datetime  :file_updated_at
      t.text      :file_info
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
