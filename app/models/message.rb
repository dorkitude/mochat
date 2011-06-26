class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  cattr_reader :per_page
  @@per_page = 15
end
