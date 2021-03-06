class EventsController < ApplicationController
  before_action :correct_referer, only:[:new,:edit]
  before_action :set_event, only:[:show,:edit,:update,:destroy]

  def index
    @search = Event.ransack(params[:q])
    @events = @search.result.order(:start_on).page(params[:page])
  end

  def show
    @comment = Comment.new
    @comments = @event.comments
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
                                  :image,
                                  :image_cache)
  end

  def set_event
    @event = Event.find(params[:id])
  end
  #特定のアクションのURL直打ちを禁止する
  def correct_referer
    if request.referer.nil?
      redirect_to events_path, notice: "このアクセス方法は許可されていません！！"
    end
  end
end
