require "chargify/connection"

module Chargify
  module Request
    def self.included(base)
      base.send(:include, Connection)
    end

    def get(path, params = {})
      request(:get, path, params)
    end

    def post(path, params = {})
      request(:post, path, params)
    end

    def put(path, params = {})
      request(:put, path, params)
    end

    def delete(path, params = {})
      request(:delete, path, params)
    end

    private
      def request(method, path, params)
        response = connection.send(method) do |request|
          case method.to_sym
          when :get, :delete
            request.url(path, params)
          when :post, :put
            request.path = path
            request.body = params
          end
        end

        response.body
      end
  end
end
