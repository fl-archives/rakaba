class CreateAdminLogEntries < ActiveRecord::Migration
  def self.up
    create_table :admin_log_entries do |t|
    	t.integer		:user_id
    	t.string		:action
      t.timestamps
    end
  end

  def self.down
    drop_table :admin_log_entries
  end
end
