class AddLastMessageAtFieldToRoomModel < ActiveRecord::Migration
  def self.up
    add_column :rooms, :last_message_at, :datetime
  end

  def self.down
    remove_column :rooms, :topic
  end
end
