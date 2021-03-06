class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destory]

  def index
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    #「戻る」ボタンの動作
    if params[:back]
      render :new
    else
      if @contact.save
        ContactMailer.contact_mail(@contact).deliver
        redirect_to root_path
        flash[:notice] = 'メールが送信されました！'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
    @contact = Contact.new(contact_params)
    #バリデーションエラーを項目入力時に確認
    return if @contact.valid?
    render :new
  end

  private

  def set_contact
    @contact = Contact.find(params_id)
  end

  def contact_params
    params.require(:contact).permit(:reserved_name,
                                    :name,
                                    :phone_number,
                                    :email,
                                    :reserved_on,
                                    :game,
                                    :utilization_at,
                                    :number_of_people,
                                    :lane,
                                    :bus,
                                    :meeting_room,
                                    :remarks)
  end
end