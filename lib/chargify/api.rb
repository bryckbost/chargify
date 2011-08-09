require "chargify/configuration"
require "chargify/connection"
require "chargify/request"

module Chargify
  class API
    include Connection
    include Request

    attr_accessor *Configuration::DEFAULT_OPTIONS.keys

    def initialize(options = {})
      Chargify.options.merge(options).each{|k,v| send("#{k}=", v) }
    end
  end
end
