class CreateTwos < ActiveRecord::Migration
  def self.up
    create_table :two_a do |t|
    	t.integer :one_id
      t.timestamps
    end

    create_table :two_b do |t|
    	t.integer :one_id
      t.timestamps
    end
  end

  def self.down
    drop_table :twos
  end
end
