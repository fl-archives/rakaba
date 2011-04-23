class CreateRThreads < ActiveRecord::Migration
  def self.up
    boards = [:b, :d, :c, :s, :a, :bb]
    boards.each do |board|
      board = "#{board}_threads".to_sym
      create_table board do |t|
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
  end

  def self.down
    boards = [:b, :d, :c, :s, :a, :bb]
    boards.each do |board|
      drop_table "#{board}_threads".to_sym
    end
  end
end
