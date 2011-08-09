require "chargify/api"

module Chargify
  class Client < API
    require "chargify/client/products"

    include Chargify::Client::Products
  end
end
