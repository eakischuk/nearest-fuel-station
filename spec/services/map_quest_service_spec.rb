require 'rails_helper'

RSpec.describe MapQuestService do
  it 'gets directions' do
    start = '5224 W 25th Ave, Denver, CO 80214'
    end_location = '700 Golden Ridge Rd, Golden, Colorado 80401'

    response = MapQuestService.directions(start, end_location)
    expect(response).to have_key(:route)
    expect(response[:route]).to be_a(Hash)
    expect(response[:route]).to have_key(:formattedTime)
    expect(response[:route][:formattedTime]).to be_a(String)
    expect(response[:route]).to have_key(:distance)
    expect(response[:route][:distance]).to be_a(Float)
    expect(response[:route]).to have_key(:legs)
    expect(response[:route][:legs]).to be_an(Array)
    expect(response[:route][:legs].first).to be_a(Hash)
    expect(response[:route][:legs].first).to have_key(:maneuvers)
    expect(response[:route][:legs].first[:maneuvers]).to be_an(Array)
    expect(response[:route][:legs].first[:maneuvers].first).to have_key(:narrative)
  end
end
