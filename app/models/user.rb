class User < ActiveRecord::Base
  has_many :messages
  has_many :whispers, :foreign_key => "sender_id"
  has_many :whispers, :foreign_key => "receiver_id"
  has_one :room, :foreign_key => "creator_id"
  has_one :user_room, :foreign_key => "user_id"
end
