class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text      :message
      t.string    :board
      t.integer   :rid
      t.integer   :user_id
      t.integer   :ip_id
      t.integer   :r_thread_id
      t.integer   :thread_id
      t.boolean   :hidden,            default: false
      t.boolean   :sage,              default: false
      t.string    :file_name
      t.string    :file_type
      t.integer   :file_size
      t.timestamps
    end

    add_index :posts, [:rid, :board], unique: true
    add_index :posts, :ip_id
    add_index :posts, :board
    add_index :posts, :user_id
    add_index :posts, :r_thread_id
    add_index :posts, :thread_id
  end

  def self.down
    INITIAL_BOARDS.each do |board|
      drop_table "#{board[:alias]}_posts".to_sym
    end
  end
end
