require "chargify/error"
require "faraday"

module Faraday
  class Response::ClientError < Response::Middleware
    def on_complete(env)
      case env[:status].to_i
      when 400 then raise Chargify::BadRequest
      when 401 then raise Chargify::Unauthorized
      when 402 then raise Chargify::PaymentRequired
      when 403 then raise Chargify::Forbidden
      when 404 then raise Chargify::NotFound
      when 405 then raise Chargify::MethodNotAllowed
      when 406 then raise Chargify::NotAcceptable
      when 407 then raise Chargify::ProxyAuthenticationRequired
      when 408 then raise Chargify::RequestTimeout
      when 409 then raise Chargify::Conflict
      when 410 then raise Chargify::Gone
      when 411 then raise Chargify::LengthRequired
      when 412 then raise Chargify::PreconditionFailed
      when 413 then raise Chargify::RequestEntityTooLarge
      when 414 then raise Chargify::RequestUriTooLong
      when 415 then raise Chargify::UnsupportedMediaType
      when 416 then raise Chargify::RequestedRangeNotSatisfiable
      when 417 then raise Chargify::ExpectationFailed
      when 418 then raise Chargify::ImATeapot
      when 422 then raise Chargify::UnprocessableEntity
      when 423 then raise Chargify::Locked
      when 424 then raise Chargify::FailedDependency
      when 425 then raise Chargify::UnorderedCollection
      when 426 then raise Chargify::UpgradeRequired
      when 444 then raise Chargify::NoResponse
      when 449 then raise Chargify::RetryWith
      when 450 then raise Chargify::BlockedByWindowsParentalControls
      when 499 then raise Chargify::ClientClosedRequest
      end
    end
  end
end
