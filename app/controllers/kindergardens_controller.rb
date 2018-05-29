class KindergardensController < ApplicationController

  def index
    @kindergardens = Kindergarden.all
  end


end
