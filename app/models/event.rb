class Event < ApplicationRecord
  belongs_to :creator, classname: 'User'
end
