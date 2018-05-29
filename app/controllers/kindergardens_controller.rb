class KindergardensController < ApplicationController

  def index
    @kindergardens = Kindergarden.all
  end

<<<<<<< HEAD

=======
  def show
    @kindergarden = Kindergarden.find(params[:id])
  end
>>>>>>> master
end
