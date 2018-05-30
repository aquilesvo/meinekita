class InquiriesController < ApplicationController
before_action :set_inquiry, only: [:show, :edit, :update, :destroy]
before_action :set_kindergarden, only: [:show, :new, :create, :show, :destroy]

  def index
    x = Inquiry.all.sort_by(&:updated_at)
    @inquiries = x.reverse
    # @inquiries = inquiries.group_by(:kindergarden_id)
    # sorted = @records.sort_by &:created_at
  end

  def show

  end

  def new
    @inquiry = Inquiry.new()
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user_id = current_user.id
    @inquiry.kindergarden_id = params[:kindergarden_id]
    @inquiry.save
    redirect_to inquiries_path
  end

  def edit
  end

  def update
    @inquiry.update(inquiry_params)
  end

  def destroy
    @inquiry.destroy
    redirect_to inquiries_path
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
end

