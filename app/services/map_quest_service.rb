class MapQuestService
  def self.directions(start_location, end_location)
    response = conn.get('/directions/v2/route') do |req|
      req.params['from'] = start_location
      req.params['to'] = end_location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com', params: {key: ENV['map_quest_key']})
  end
end
