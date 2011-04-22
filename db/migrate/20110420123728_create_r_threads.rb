class CreateRThreads < ActiveRecord::Migration
  def self.up
    create_table :b_threads do |t|
    	t.text			:message
    	t.string		:title
    	t.string		:ip
    	t.integer		:_id
    	t.integer		:replies_count, default: 0
    	t.integer		:author_id
    	t.integer		:board_id
    	t.boolean		:hidden, default: false
    	t.boolean		:sticky, default: false
    	t.datetime	:bump
      t.string    :file_file_name
      t.string    :file_content_type
      t.integer   :file_file_size
      t.datetime  :file_updated_at
      t.text      :file_info
      t.timestamps
    end
  end

  def self.down
    drop_table :r_threads
  end
end
