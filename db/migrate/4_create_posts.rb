class CreatePosts < ActiveRecord::Migration
  def self.up
    INITIAL_BOARDS.each do |board|
      board = "#{board[:alias]}_posts".to_sym    
      create_table board do |t|
      	t.text			:message
      	t.integer		:_id
      	t.integer		:user_id
        t.integer   :ip_id
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

      add_index board, :ip_id,      unique: false
      add_index board, :_id,        unique: true
      add_index board, :user_id,    unique: false
      add_index board, :thread_id,  unique: false
      add_index board, :hidden,     unique: false
    end
  end

  def self.down
    INITIAL_BOARDS.each do |board|
      drop_table "#{board[:alias]}_posts".to_sym
    end
  end
end
