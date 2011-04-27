class CreateRThreads < ActiveRecord::Migration
  def self.up
    create_table :r_threads do |t|
      t.text      :message
      t.string    :title
      t.string    :board
      t.integer   :_id
      t.integer   :replies_count,   default: 0
      t.integer   :user_id
      t.integer   :ip_id
      t.boolean   :hidden,          default: false
      t.boolean   :sticky,          default: false
      t.datetime  :bump
      t.string    :file_file_name
      t.string    :file_content_type
      t.integer   :file_file_size
      t.datetime  :file_updated_at
      t.text      :file_info
      t.timestamps
    end

    add_index :r_threads, [:_id, :board], unique: true
    add_index :r_threads, :ip_id
    add_index :r_threads, :board
    add_index :r_threads, :user_id
  end

  def self.down
    drop_table :r_threads
  end
end
