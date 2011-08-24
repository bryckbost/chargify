require "chargify/version"
require "faraday_middleware"
require "faraday/request/encode_json"
require "faraday/response/client_error"
require "faraday/response/json_root"
require "faraday/response/server_error"

module Chargify
  module Connection
    def self.included(base)
      base.send(:include, Configuration)
    end

    private
      def connection
        options = {
          :headers => {
            :accept => "application/json",
            :user_agent => "Chargify Ruby Gem #{VERSION}"
          },
          :ssl => {:verify => false},
          :url => "https://#{subdomain}.chargify.com/"
        }

        connection = Faraday.new(options) do |builder|
          builder.request :EncodeJson
          builder.response :Mashify
          builder.response :JsonRoot
          builder.response :ParseJson
          builder.response :ClientError
          builder.response :ServerError
          builder.adapter :net_http
        end

        connection.basic_auth api_key, "x"
        connection
      end
  end
end
