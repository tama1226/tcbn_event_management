class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.js {render:index}
      else
        format.html {redirect_to event_path(@event), notice:'投稿不可！'}
      end  
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:event_id,:content)
  end
end
