class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_registrations, class_name: 'EventRegistration', dependent: :destroy
  has_many :events, through: :event_registrations, dependent: :destroy
  has_many :organized_events, class_name: 'Event', foreign_key: 'organizer_id'

  validates :name, presence: true, length: { in: 3..15 }
  validates :surname, presence: true, length: { in: 3..15 }
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :phone, presence: true, uniqueness: true



  def profile_complete?
    name.present? && surname.present? && age.present? && phone.present?
  end
end
