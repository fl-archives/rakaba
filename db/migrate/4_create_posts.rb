class CreatePosts < ActiveRecord::Migration
  def self.up
    INITIAL_BOARDS.each_key do |board|
      board = "#{board}_posts".to_sym    
      create_table board do |t|
      	t.text			:message
      	t.string		:ip
      	t.integer		:_id
      	t.integer		:author_id
      	t.integer		:thread_id
      	t.boolean		:hidden,            default: false
      	t.boolean		:sage,              default: false
        t.string    :file_file_name
        t.string    :file_content_type
        t.integer   :file_file_size
        t.datetime  :file_updated_at
        t.text      :file_info
        t.timestamps
      end

      add_index board, :ip,         unique: false
      add_index board, :_id,        unique: true
      add_index board, :author_id,  unique: false
      add_index board, :thread_id,  unique: false
      add_index board, :hidden,     unique: false
    end
  end

  def self.down
    drop_table :posts
  end
end
