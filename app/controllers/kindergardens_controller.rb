class KindergardensController < ApplicationController

  def index
    @kindergardens = Kindergarden.where.not(lat: nil, long: nil)

    @markers = @kindergardens.map do |kindergarden|
      {
        lat: kindergarden.lat,
        lng: kindergarden.long,
        infoWindow: { content: render_to_string(partial: "/kindergardens/map_box", locals: { kindergarden: kindergarden }) }
      }
    end
  end

  def show
    @kindergarden = Kindergarden.find(params[:id])
  end

end
