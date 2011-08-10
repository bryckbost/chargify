require "chargify/connection"

module Chargify
  module Request
    def self.included(base)
      base.send(:include, Connection)
    end

    def get(path, options = {})
      request(:get, path, options)
    end

    def post(path, options = {})
      request(:post, path, options)
    end

    def put(path, options = {})
      request(:put, path, options)
    end

    def delete(path, options = {})
      request(:delete, path, options)
    end

    private
      def request(method, path, options)
        response = connection.send(method) do |request|
          case method.to_sym
          when :get, :delete
            request.url(formatted_path(path), options)
          when :post, :put
            request.path = formatted_path(path)
            request.body = options unless options.empty?
          end
        end

        response.body
      end

      def formatted_path(path)
        "#{path}.json".sub(/^\//, "")
      end
  end
end
