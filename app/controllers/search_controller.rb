class SearchController < ApplicationController
  def index
    connection = Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1')
    response = connection.get('nearest', location: params[:query], radius: 6.0, limit: 10, fuel_type: 'ELEC,LPG', api_key: 'BY2X2d5yFomckQzWWekeYdeWSXPAVgW5XleSP3Ui', format: 'json')
    render json: response.body
  end
end

