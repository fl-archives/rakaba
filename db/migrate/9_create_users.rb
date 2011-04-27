class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.text      :settings
      t.text      :seen
      t.string    :password
      t.integer   :ban_id
      t.integer   :level,     default: 1
      t.datetime  :last_post
      t.datetime  :last_thread
      t.timestamps
    end

    add_index :users, :password, unique: true
  end

  def self.down
    drop_table :users
  end
end
