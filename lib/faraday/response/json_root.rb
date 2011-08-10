require "faraday"

module Faraday
  class Response::JsonRoot < Response::Middleware
    def parse(body)
      case body
      when Hash
        if body.size == 1 && body.values.first.is_a?(Hash)
          parse(body.values.first)
        else
          body
        end
      when Array
        body.map{|e| parse(e) }
      else
        body
      end
    end
  end
end
