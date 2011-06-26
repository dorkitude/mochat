class User < ActiveRecord::Base
  has_many :messages
  has_many :whispers, :foreign_key => "sender_id"
  has_many :whispers, :foreign_key => "receiver_id"
  has_one :created_room, :foreign_key => "creator_id"
  has_one :user_room, :foreign_key => "user_id"


  def self.hash_password(username, password)
    salt = ENV['password_salt'] || 'hello_ninjas_%!@$@!$'
    Digest::SHA1.hexdigest(salt + username + password)
  end


  def user_room
    if not @_user_room
      @_user_room = UserRoom.find_by_user_id(id)

      if not @_user_room
        @_user_room = UserRoom.new
        @_user_room.user_id = id
        @_user_room.save
      end
    end

    return @_user_room
  end

  def join_room(new_room)
    if user_room.room_id == new_room.id
      return
    end

    user_room.room = new_room
    user_room.save
  end

  def room
    if user_room
      user_room.room
    else
      nil
    end
  end

end
