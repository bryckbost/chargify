module Chargify
  module Configuration
    DEFAULT_OPTIONS = {
      :api_key   => nil,
      :subdomain => nil
    }

    attr_accessor *DEFAULT_OPTIONS.keys

    def self.included(base)
      base.class_eval{ attr_accessor *DEFAULT_OPTIONS.keys }
    end

    def configure
      yield self
    end

    def options
      options = {}
      DEFAULT_OPTIONS.keys.each{|k| options[k] = send(k) }
      options
    end

    def reset
      DEFAULT_OPTIONS.each{|k,v| send("#{k}=", v) }
    end
  end
end
