class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :phone
      t.string :email
      t.string :password
      t.string :handle
      t.string :type
      t.integer :age
      t.string :gender
      t.string :location
      t.datetime :last_message_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
