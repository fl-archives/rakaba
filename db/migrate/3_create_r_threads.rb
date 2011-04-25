class CreateRThreads < ActiveRecord::Migration
  def self.up
    INITIAL_BOARDS.each do |board|
      board = "#{board[:alias]}_threads".to_sym
      create_table board do |t|
      	t.text			:message
      	t.string		:title
      	t.string		:ip
      	t.integer		:_id
      	t.integer		:replies_count,   default: 0
      	t.integer		:author_id
      	t.integer		:board_id
      	t.boolean		:hidden,          default: false
      	t.boolean		:sticky,          default: false
      	t.datetime	:bump
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
      add_index board, :hidden,     unique: false
    end
  end

  def self.down
    INITIAL_BOARDS.each do |board|
      drop_table "#{board[:alias]}_threads".to_sym
    end
  end
end
