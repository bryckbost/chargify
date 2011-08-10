require "spec_helper"

describe Chargify::API do
  before do
    Chargify.api_key = "94RghvPlxJKW7vsDfvVr"
    Chargify.subdomain = "chargify"
  end

  it "mirrors the global configuration" do
    api = Chargify::API.new
    api.api_key.should == "94RghvPlxJKW7vsDfvVr"
    api.subdomain.should == "chargify"
  end

  it "merges the global configuration" do
    api = Chargify::API.new(:subdomain => "acme")
    api.api_key.should == "94RghvPlxJKW7vsDfvVr"
    api.subdomain.should == "acme"
  end

  it "can be reconfigured after initialization" do
    api = Chargify::API.new
    api.subdomain = "acme"
    api.api_key.should == "94RghvPlxJKW7vsDfvVr"
    api.subdomain.should == "acme"
  end
end
