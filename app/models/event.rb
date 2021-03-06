class Event < ApplicationRecord
  validates :name, :description, :date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances

  scope :past, -> { where('date < ?', Time.now) }
  scope :upcoming, -> { where('date > ?', Time.now) }
end
