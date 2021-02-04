class User < ApplicationRecord
  has_many :created_events, classname: 'Event', foreing_key: 'creator_id'
  validates :name, uniqueness: true 
end
