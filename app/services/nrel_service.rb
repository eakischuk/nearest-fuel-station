class NrelService
  def self.request_api(path, location, type)
    response = conn.get(path) do |req|
      req.params['location'] = location
      req.params['fuel_type'] = type
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://developer.nrel.gov', params: {api_key: ENV['nrel_api_key']})
  end
end
