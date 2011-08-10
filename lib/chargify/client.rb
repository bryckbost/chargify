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

    include Products
    include Components
    include Coupons
    include Customers
    include Subscriptions
    include Transactions
    include Migrations
    include Charges
    include Adjustments
    include Usages
    include Refunds
    include Statements
  end
end
