require "spec_helper"

describe Chargify::Configuration do
  let :configurable do
    klass = Class.new
    klass.extend Chargify::Configuration
    klass
  end

  it "keeps an API key" do
    configurable.api_key = "94RghvPlxJKW7vsDfvVr"
    configurable.api_key.should == "94RghvPlxJKW7vsDfvVr"
  end

  it "has no default API key" do
    configurable.api_key.should be_nil
  end

  it "keeps a subdomain" do
    configurable.subdomain = "chargify"
    configurable.subdomain.should == "chargify"
  end

  it "has no default subdomain" do
    configurable.subdomain.should be_nil
  end

  it "sets via block" do
    configurable.configure do |config|
      config.api_key = "94RghvPlxJKW7vsDfvVr"
      config.subdomain = "chargify"
    end
    configurable.api_key.should == "94RghvPlxJKW7vsDfvVr"
    configurable.subdomain.should == "chargify"
  end

  it "represents itself as a hash" do
    configurable.api_key = "94RghvPlxJKW7vsDfvVr"
    configurable.subdomain = "chargify"
    configurable.options.should == {
      :api_key => "94RghvPlxJKW7vsDfvVr",
      :subdomain => "chargify"
    }
  end

  it "can reset to defaults" do
    configurable.api_key = "94RghvPlxJKW7vsDfvVr"
    configurable.subdomain = "chargify"
    configurable.reset
    configurable.api_key.should be_nil
    configurable.subdomain.should be_nil
  end
end
