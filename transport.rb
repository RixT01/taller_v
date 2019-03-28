require 'faraday'
require 'json'

module Transport

  # FIXME fix this
  URL = "http://app"
  def self.conn
    @conn ||= Faraday.new(url: URL) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests and responses to $stdout
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  # http://app/car/result/{teamNumber}/{total}
  def self.set_result(team:, model_type:, total: , cars:)
    conn.post do | req |
      req.url "/car/result/#{team}/#{model_type}/#{total}"
      req.headers['Content-Type'] = 'application/json'
      req.body = build_body(cars: cars)
    end
  end

  def self.build_body(cars:)
    cars.map(&:to_json)
  end
end
