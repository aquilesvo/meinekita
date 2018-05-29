class InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new()
  end
end
