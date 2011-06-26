class User < ActiveRecord::Base
  has_many :messages
  has_many :whispers, :foreign_key => "sender_id"
  has_many :whispers, :foreign_key => "receiver_id"
  has_one :room, :foreign_key => "creator_id"
  has_one :user_room, :foreign_key => "user_id"


  def self.hash_password(username, password)
    salt = ENV['password_salt'] || 'hello_ninjas_%!@$@!$'
    Digest::SHA1.hexdigest(salt + username + password)
  end

  def self.authenticate_login_attempt(username, password)
    user = User.find_by_username(username)

    if not user
      return false
    end

    hashed_pass = self.hash_password(username, password)

    if user.password == hashed_pass
      return user
    end

  end

end
