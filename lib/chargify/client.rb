require "chargify/api"

module Chargify
  class Client < API
    require "chargify/client/products"
    require "chargify/client/components"
    require "chargify/client/coupons"
    require "chargify/client/customers"
    require "chargify/client/subscriptions"
    require "chargify/client/transactions"
    require "chargify/client/migrations"
    require "chargify/client/charges"
    require "chargify/client/adjustments"
    require "chargify/client/usages"
    require "chargify/client/refunds"
    require "chargify/client/statements"

    include Chargify::Client::Products
    include Chargify::Client::Components
    include Chargify::Client::Coupons
    include Chargify::Client::Customers
    include Chargify::Client::Subscriptions
    include Chargify::Client::Transactions
    include Chargify::Client::Migrations
    include Chargify::Client::Charges
    include Chargify::Client::Adjustments
    include Chargify::Client::Usages
    include Chargify::Client::Refunds
    include Chargify::Client::Statements
  end
end
