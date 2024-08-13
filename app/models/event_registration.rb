class EventRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, :event_id, :presence => true,  uniqueness: { scope: :event_id, message: "уже зарегистрирован на это событие" }

end
