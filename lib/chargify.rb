require "chargify/client"
require "chargify/configuration"

module Chargify
  extend Configuration

  def self.client
    @client ||= Client.new
  end

  def self.method_missing(method, *args, &block)
    client.respond_to?(method) ? client.send(method, *args, &block) : super
  end

  def self.respond_to?(*args)
    client.respond_to?(*args) || super
  end
end
