class InquiriesController < ApplicationController
before_action :set_inquiry, only: [:show, :edit, :update, :destroy, :alert!]
before_action :set_kindergarden, only: [:show, :new, :create, :show, :destroy]
before_action :set_sorted_inquiries, only: [:index, :destroy, :show]


  def index
    @grouped_inquiries = @inquiries.group_by { |d| d[:kindergarden_id] }
    @bookmarks = Bookmark.where(:user_id == current_user.id)
    # @kindergarden = Kindergarden.find(@inquiries[0].kindergarden_id)
    # sorted = @records.sort_by &:created_at
  end

  def show

  end

  def new
    @inquiry = Inquiry.new()
  end

  def create
    @user = current_user
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user_id = current_user.id
    @inquiry.kindergarden_id = params[:kindergarden_id]
    @inquiry.alert = params[:inquiry][:alert].to_datetime
    @inquiry.save
    # if @inquiry.alert
    #   send_alert_email
    # end
    redirect_to inquiries_path
  end

  def edit
  end

  def update
    @inquiry.update(inquiry_params)
  end

  def destroy
    kita = Kindergarden.find(@inquiry.kindergarden_id)
    inquiries = @inquiries.select do |inquiry| kita.inquiry_ids.include?(inquiry.id) end
    inquiries.delete(id: @inquiry.id)
    inquiry = inquiries.first
    @inquiry.destroy
    redirect_to kindergarden_inquiry_path(kita, inquiry)

  end

  def alert!
    @inquiry.alert = true
    @inquiry.save
  end

  private

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end

  def inquiry_params
    params.require(:inquiry).permit(:subject, :content)
  end

  def set_kindergarden
    @kindergarden = Kindergarden.find(params[:kindergarden_id])
  end

  def send_alert_email
      UserMailer.alert(current_user).deliver_now
  end

  def set_sorted_inquiries
    users_inquiries = Inquiry.where(user_id: current_user.id)
    sorted_inquiries = users_inquiries.sort_by(&:updated_at)
    @inquiries = sorted_inquiries.reverse
  end
end

