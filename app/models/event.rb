class Event < ApplicationRecord
  has_many :event_registrations
  has_many :users, through: :event_registrations


  belongs_to :organizer, foreign_key: :organizer_id, class_name: "User"

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true

end
