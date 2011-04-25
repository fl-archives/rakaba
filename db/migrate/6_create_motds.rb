class CreateMotds < ActiveRecord::Migration
  def self.up
    create_table :motds do |t|
    	t.integer		:user_id
    	t.text			:message
      t.timestamps
    end
  end

  def self.down
    drop_table :motds
  end
end
