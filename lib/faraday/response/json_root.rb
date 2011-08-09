require "faraday"

module Faraday
  class Response::JsonRoot < Response::Middleware
    def parse(body)
      case body
      when Hash
        body.size == 1 ? body.values.first : body
      when Array
        body.map{|e| parse(e) }
      else
        body
      end
    end
  end
end
