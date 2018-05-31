class KindergardensController < ApplicationController

  def index
    params[:search] = params[:search] || {}

    params[:search].each do |key, value|
      params[:search][key].reject!(&:blank?)
    end

    @kindergardens = Kindergarden.search(params[:search])

    #.

    @markers = @kindergardens.map do |kindergarden|
      {
        lat: kindergarden.lat,
        lng: kindergarden.long,
        infoWindow: { content: render_to_string(partial: "/kindergardens/map_box", locals: { kindergarden: kindergarden }) }
      }
    end

  respond_to do |format|
    format.html
    format.js {render layout:false }
  end

  end

  def show
    @kindergarden = Kindergarden.find(params[:id])
  end

end
