class KindergardensController < ApplicationController

  def index

    if params[:query].present?
      kindergardens = Kindergarden.near(params[:query], 1.5, :units => :km).paginate(:page => params[:page], :per_page => 10)
      @kindergardens = kindergardens.to_a
      @markers = @kindergardens.map do |kindergarden|
        {
          lat: kindergarden.latitude,
          lng: kindergarden.longitude,
          infoWindow: { content: render_to_string(partial: "/kindergardens/map_box", locals: { kindergarden: kindergarden }) }
        }

      end
      @markers_json = @markers.to_json

    elsif params[:search].present?
       params[:search] = params[:search] || {}
        puts params[:search]

        params[:search].each do |key, value|
          unless params[:search][key].kind_of? String
            params[:search][key].reject!(&:blank?)
          end
        end


        kindergardens = Kindergarden.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
        @kindergardens = kindergardens

        @markers = @kindergardens.map do |kindergarden|
          {
            lat: kindergarden.latitude,
            lng: kindergarden.longitude,
            infoWindow: { content: render_to_string(partial: "/kindergardens/map_box", locals: { kindergarden: kindergarden }) }
          }
        end
        @markers_json = @markers.to_json

      respond_to do |format|
        format.html
        format.js {render layout:false }
      end

    else
      @kindergardens = Kindergarden.where.not(latitude: nil, longitude: nil).paginate(:page => params[:page], :per_page => 10)

      @markers = @kindergardens.map do |kindergarden|
        {
          lat: kindergarden.latitude,
          lng: kindergarden.longitude,
          infoWindow: { content: render_to_string(partial: "/kindergardens/map_box", locals: { kindergarden: kindergarden }) }
        }
      end
      @markers_json = @markers.to_json
    end
  end

  def show
    @kindergarden = Kindergarden.find(params[:id])
    @markers =  [{
            lat: @kindergarden.latitude,
            lng: @kindergarden.longitude,
            infoWindow: { content: render_to_string(partial: "/kindergardens/map_box", locals: { kindergarden: @kindergarden }) }
          }]
  end
end
