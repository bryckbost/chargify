require "chargify/configuration"
require "chargify/request"

module Chargify
  class Client
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

    include Request

    attr_accessor *Configuration::DEFAULT_OPTIONS.keys

    def initialize(options = {})
      Chargify.options.merge(options).each{|k,v| send("#{k}=", v) }
    end
  end
end
