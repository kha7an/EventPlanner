class Event < ApplicationRecord
  has_many :event_registrations, dependent: :destroy
  has_many :users, through: :event_registrations


  belongs_to :organizer, foreign_key: :organizer_id, class_name: "User"

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validate :date_cannot_be_in_the_past


  def date_cannot_be_in_the_past
    if date.present? && date < DateTime.now
      errors.add(:date, "не может быть в прошлом")
    end
  end
end
