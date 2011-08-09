require "chargify/client"
require "chargify/configuration"

module Chargify
  extend Configuration

  def self.new(options = {})
    Chargify::Client.new(options)
  end

  def self.method_missing(method, *args, &block)
    instance = new
    instance.respond_to?(method) ? instance.send(method, *args, &block) : super
  end

  def respond_to?(method, include_private = false)
    new.respond_to?(method, include_private) || super(method, include_private)
  end
end
