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

        # distances = {}
        # @kindergardens = Kindergarden.search(params[:search]).order_bypaginate(:page => params[:page], :per_page => 10)
        unsorted = Kindergarden.search(params[:search]).to_a
        sorted = unsorted.sort { |kita1, kita2| kita1.distance_from('Görlizer Park, Berlin') <=> kita2.distance_from('Görlizer Park, Berlin') }

        # sorted = unsorted.near('Görlizer Park, Berlin', 1.5, :units => :km).order("distance")
        @kindergardens = sorted.paginate(:page => params[:page], :per_page => 10)

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
