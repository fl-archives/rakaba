class CreateBans < ActiveRecord::Migration
  def self.up
    create_table :bans do |t|
    	t.text			:reason
      t.integer   :level
    	t.datetime	:expires_at
      t.timestamps
    end
  end

  def self.down
    drop_table :bans
  end
end
