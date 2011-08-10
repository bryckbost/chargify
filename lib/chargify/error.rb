module Chargify
  class Error < StandardError; end

  class ClientError < Error; end

  class BadRequest                       < ClientError; end
  class Unauthorized                     < ClientError; end
  class PaymentRequired                  < ClientError; end
  class Forbidden                        < ClientError; end
  class NotFound                         < ClientError; end
  class MethodNotAllowed                 < ClientError; end
  class NotAcceptable                    < ClientError; end
  class ProxyAuthenticationRequired      < ClientError; end
  class RequestTimeout                   < ClientError; end
  class Conflict                         < ClientError; end
  class Gone                             < ClientError; end
  class LengthRequired                   < ClientError; end
  class PreconditionFailed               < ClientError; end
  class RequestEntityTooLarge            < ClientError; end
  class RequestUriTooLong                < ClientError; end
  class UnsupportedMediaType             < ClientError; end
  class RequestedRangeNotSatisfiable     < ClientError; end
  class ExpectationFailed                < ClientError; end
  class ImATeapot                        < ClientError; end
  class UnprocessableEntity              < ClientError; end
  class Locked                           < ClientError; end
  class FailedDependency                 < ClientError; end
  class UnorderedCollection              < ClientError; end
  class UpgradeRequired                  < ClientError; end
  class NoResponse                       < ClientError; end
  class RetryWith                        < ClientError; end
  class BlockedByWindowsParentalControls < ClientError; end
  class ClientClosedRequest              < ClientError; end

  class ServerError < Error; end

  class InternalServerError     < ServerError; end
  class NotImplemented          < ServerError; end
  class BadGateway              < ServerError; end
  class ServiceUnavailable      < ServerError; end
  class GatewayTimeout          < ServerError; end
  class HttpVersionNotSupported < ServerError; end
  class VariantAlsoNegotiates   < ServerError; end
  class InsufficientStorage     < ServerError; end
  class BandwidthLimitExceeded  < ServerError; end
  class NotExtended             < ServerError; end
end
