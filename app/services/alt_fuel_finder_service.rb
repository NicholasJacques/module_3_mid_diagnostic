class AltFuelFinderService
  attr_reader :connection, :token

  def initialize
    @connection = Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1')
    @token = ENV['ALT_FUEL_STATIONS_KEY']
  end

  def nearest_stations(zipcode)
    parse(connection.get('nearest', location: zipcode, radius: 6.0, limit: 10, fuel_type: 'ELEC,LPG', api_key: token, format: 'json'))
  end

  private

  def parse(response)
    byebug
    JSON.parse(response.body, symbolize_names: true)
  end

end
