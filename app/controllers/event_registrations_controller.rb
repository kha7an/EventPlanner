class EventRegistrationsController < ApplicationController
  before_action :set_event, only: %i[ create destroy ]
  before_action :authenticate_user!
  before_action :ensure_profile_complete


  def create
    @registration = @event.event_registrations.build(user: current_user)

    if @registration.save
      redirect_to @event, notice: "Вы зарегистировались на мероприятие!"
    else
      redirect_to @event, notice: "Вы уже зарегистированы на мероприятие!"
    end
  end

  def destroy
    @registration = @event.event_registrations.find_by(user: current_user)
    if @registration
      @registration.destroy
      redirect_to @event, notice: "Ваша регистрация была отменена!"
    else
      redirect_to @event, notice: "Вы не зарегистированы на мероприятие!"
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def ensure_profile_complete
    unless current_user.profile_complete?
      redirect_to edit_user_registration_path, alert: 'Пожалуйста, заполните профиль перед регистрацией на мероприятие.'
    end
  end
end
