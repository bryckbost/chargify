require "spec_helper"

describe Chargify::Client do
  before do
    Chargify.api_key = "94RghvPlxJKW7vsDfvVr"
    Chargify.subdomain = "chargify"
  end

  it "inherits global configuration" do
    client = Chargify::Client.new
    client.api_key.should == "94RghvPlxJKW7vsDfvVr"
    client.subdomain.should == "chargify"
  end

  it "merges global configuration" do
    client = Chargify::Client.new(:subdomain => "acme")
    client.api_key.should == "94RghvPlxJKW7vsDfvVr"
    client.subdomain.should == "acme"
  end

  it "can be reconfigured after initialization" do
    client = Chargify::Client.new
    client.subdomain = "acme"
    client.subdomain.should == "acme"
  end
end
