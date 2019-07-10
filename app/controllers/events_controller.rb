class EventsController < ApplicationController
  before_action :set_event, only:[:show,:edit,:update,:destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to events_path, notice: "イベントを登録！！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "イベントの編集！！"
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "イベントの削除！！"
  end

  private
  
  def event_params
    params.require(:event).permit(:name,
                                  :kind,
                                  :start_on,
                                  :price,
                                  :game,
                                  :lane,
                                  :remarks,
                                  :image)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
