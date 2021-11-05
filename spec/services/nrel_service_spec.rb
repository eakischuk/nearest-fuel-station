require 'rails_helper'

RSpec.describe NrelService do
  it 'connect to nrel api' do
    response = NrelService.request_api('/api/alt-fuel-stations/v1/nearest.json', '700 Golden Ridge Rd, Golden, Colorado', 'ELEC')
    expect(response).to be_a(Hash)
    expect(response).to have_key(:fuel_stations)
    expect(response[:fuel_stations]).to be_an(Array)
    expect(response[:fuel_stations].first).to be_a(Hash)
    expect(response[:fuel_stations].first).to have_key(:station_name)
    expect(response[:fuel_stations].first[:station_name]).to be_a(String)
    expect(response[:fuel_stations].first).to have_key(:street_address)
    expect(response[:fuel_stations].first[:street_address]).to be_a(String)
    expect(response[:fuel_stations].first).to have_key(:city)
    expect(response[:fuel_stations].first[:city]).to be_a(String)
    expect(response[:fuel_stations].first).to have_key(:state)
    expect(response[:fuel_stations].first[:state]).to be_a(String)
    expect(response[:fuel_stations].first).to have_key(:zip)
    expect(response[:fuel_stations].first[:zip]).to be_a(String)
    expect(response[:fuel_stations].first).to have_key(:fuel_type_code)
    expect(response[:fuel_stations].first[:fuel_type_code]).to be_a(String)
    expect(response[:fuel_stations].first).to have_key(:access_days_time)
    expect(response[:fuel_stations].first[:access_days_time]).to be_a(String)
  end
end
