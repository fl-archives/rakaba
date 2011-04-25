class CreateIds < ActiveRecord::Migration
  def self.up
    create_table :ids do |t|
    	t.text	    :ids
      t.integer   :total
      t.timestamps
    end

    Ids.create ids: Hash.new, total: 0
  end

  def self.down
    drop_table :ids
  end
end
