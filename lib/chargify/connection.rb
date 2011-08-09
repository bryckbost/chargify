require "chargify/version"
require "faraday_middleware"
require "faraday/response/json_root"

module Chargify
  module Connection
    private
      def connection
        options = {
          :headers => {
            :accept => "application/json",
            :user_agent => "Chargify Ruby Gem #{VERSION}",
          },
          :ssl => {
            :verify => false
          },
          :url => "https://#{subdomain}.chargify.com/"
        }

        connection = Faraday.new(options) do |builder|
          builder.use Faraday::Response::Mashify
          builder.use Faraday::Response::JsonRoot
          builder.use Faraday::Response::ParseJson
          builder.adapter(:net_http)
          builder.use Faraday::Request::UrlEncoded
        end

        connection.basic_auth api_key, "x"
        connection
      end
  end
end
