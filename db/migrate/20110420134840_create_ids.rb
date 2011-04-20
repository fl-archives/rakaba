class CreateIds < ActiveRecord::Migration
  def self.up
    create_table :ids do |t|
    	t.text	:ids
      t.timestamps
    end
  end

  def self.down
    drop_table :ids
  end
end
