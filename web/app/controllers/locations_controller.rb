class LocationsController < ApplicationController
  def index
    render json: Location.order(:name).select(:id, :name).as_json
  end
end
