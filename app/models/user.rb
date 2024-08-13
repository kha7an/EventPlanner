class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_registrations, class_name: 'EventRegistration'
  has_many :events, through: :event_registrations

  # validates :name, presence: true, length: { in: 3..15 }
  # validates :surname, presence: true, length: { in: 3..15 }
  validates :email, presence: true, uniqueness: true
  # validates :age, presence: true, numericality: { only_integer: true }
  # validates :phone, presence: true, uniqueness: true
end
