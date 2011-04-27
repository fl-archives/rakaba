class CreateIps < ActiveRecord::Migration
  def self.up
    create_table :ips do |t|
    	t.string		:ip
    	t.integer		:ban_id
    	t.datetime	:last_post
    	t.datetime	:last_thread
      t.timestamps
    end

    add_index :ips, :ip, unique: true
  end

  def self.down
    drop_table :ips
  end
end
