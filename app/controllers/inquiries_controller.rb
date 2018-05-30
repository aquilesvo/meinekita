class InquiriesController < ApplicationController
before_action :set_inquiry, only: [:show, :destroy, :new, :create]

  def new
    @inquiry = Inquiry.new()
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user_id = current_user.id
    @inquiry.kindergarden_id = params[:kindergarden_id]
    @inquiry.save
  end

  private

end

