class EventRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :event


  validates :user_id, uniqueness: { scope: :event_id, message: "уже зарегистрирован на это событие" }

end
