class Room < ActiveRecord::Base
  belongs_to :user


  def num_chatters
    UserRoom.where("room_id = #{id}").length
  end
end
