require "chargify/error"
require "faraday"

module Faraday
  class Response::ServerError < Response::Middleware
    def on_complete(env)
      case env[:status].to_i
      when 500 then raise Chargify::InternalServerError
      when 501 then raise Chargify::NotImplemented
      when 502 then raise Chargify::BadGateway
      when 503 then raise Chargify::ServiceUnavailable
      when 504 then raise Chargify::GatewayTimeout
      when 505 then raise Chargify::HttpVersionNotSupported
      when 506 then raise Chargify::VariantAlsoNegotiates
      when 507 then raise Chargify::InsufficientStorage
      when 509 then raise Chargify::BandwidthLimitExceeded
      when 510 then raise Chargify::NotExtended
      end
    end
  end
end
