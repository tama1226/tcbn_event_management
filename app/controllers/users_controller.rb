class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #プロフィールはログインユーザーしか見れない
    unless @user.id == current_user.id
      redirect_to events_path
      flash[:notice] = '本人しか閲覧できません'
    end
  end
end
