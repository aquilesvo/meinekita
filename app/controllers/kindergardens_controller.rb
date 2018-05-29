class KindergardensController < ApplicationController

  def index
    @kindergardens = Kindergarden.all
  end

  def show
    @kindergarden = Kindergarden.find(params[:id])
  end
end
