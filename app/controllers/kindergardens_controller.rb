class KindergardensController < ApplicationController

  def index
    if params[:query].present?
      @kindergardens = Kindergarden.near(params[:query], 3, :units => :km)

      @markers = @kindergardens.map do |kindergarden|
        {
          lat: kindergarden.latitude,
          lng: kindergarden.longitude,
          infoWindow: { content: render_to_string(partial: "/kindergardens/map_box", locals: { kindergarden: kindergarden }) }
        }
      end
    else
      @kindergardens = Kindergarden.where.not(latitude: nil, longitude: nil)
      @markers = @kindergardens.map do |kindergarden|
        {
          lat: kindergarden.latitude,
          lng: kindergarden.longitude,
          infoWindow: { content: render_to_string(partial: "/kindergardens/map_box", locals: { kindergarden: kindergarden }) }
        }
      end
    end
  end

  def show
    @kindergarden = Kindergarden.find(params[:id])
  end


end
