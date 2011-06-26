class CreateUserRooms < ActiveRecord::Migration
  def self.up
    create_table :user_rooms do |t|
      t.references :user
      t.references :room

      t.timestamps
    end
  end

  def self.down
    drop_table :user_rooms
  end
end
