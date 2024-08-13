class EventRegistrationsController < ApplicationController
  before_action :set_event, only: %i[ create destroy ]
  before_action :authenticate_user!

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
end
