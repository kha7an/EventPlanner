class EventsController < ApplicationController

  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :ensure_profile_complete, only: [:new, :create]


  def index
    @events = Event.all
  end

  def show
    respond_to do |format|
      format.html # стандартный шаблон show
      format.js { render partial: 'events/event_modal' } # рендеринг частичного шаблона для модального окна
    end
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

  def modal
    @event = Event.find(params[:id])
    render partial: 'events/event_modal', locals: { event: @event }
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :price)
  end

  def ensure_profile_complete
    unless current_user.profile_complete?
      redirect_to edit_user_registration_path, alert: 'Пожалуйста, заполните профиль перед созданием мероприятия.'
    end
  end
end
