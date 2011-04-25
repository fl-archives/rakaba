class CreateIds < ActiveRecord::Migration
  def self.up
    create_table :ids do |t|
    	t.text	:ids
      t.timestamps
    end

    Ids.create ids: Hash.new
  end

  def self.down
    drop_table :ids
  end
end
