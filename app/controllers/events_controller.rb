class EventsController < ApplicationController

  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
  end

  def show

  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user

    if @event.save
      redirect_to @event, notice: "Мероприятие создано!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @event = Event.new
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Мероприятие обновлено"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "Мероприятие удалено"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
