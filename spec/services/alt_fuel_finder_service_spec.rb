require 'rails_helper'

RSpec.describe AltFuelFinderService do
  attr_reader :service

  before(:each) do
    @service = AltFuelFinderService.new
  end

  describe '.nearest_stations' do
    it 'the 10 nearest alternative energy stations' do
      VCR.use_cassette('zipcode_search') do
        results = service.nearest_stations("80210")
        station = results.first

        expect(results[:fuel_stations]).to be_a(Array)
        expect(results[:fuel_stations].first).to be_a(Hash)
      end
    end
  end
end