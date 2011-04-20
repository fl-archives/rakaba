class CreateOnes < ActiveRecord::Migration
  def self.up
    create_table :one_a do |t|
      t.timestamps
    end
    create_table :one_b do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :ones
  end
end
