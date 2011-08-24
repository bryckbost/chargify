require "faraday"

module Faraday
  class Request::EncodeJson < Faraday::Middleware
    dependency "multi_json"

    def call(env)
      env[:body] &&= MultiJson.encode(env[:body])
      @app.call(env)
    end
  end
end
