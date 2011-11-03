# encoding: utf-8
require "spec_helper"

describe Faraday::Response::JsonRoot do
  let!(:endpoint){ "http://example.com/" }
  let :connection do
    Faraday.new(:url => endpoint) do |builder|
      builder.use described_class
      builder.adapter :net_http
    end
  end

  it "expands single-key, hash-value hashes" do
    body = {:customer => {:first_name => "Steve", :last_name => "Richert"}}
    stub_request(:get, endpoint).to_return(:body => body)
    connection.get("/").body.should == body[:customer]
  end

  it "passes multi-key hashes" do
    body = {:first_name => "Steve", :last_name => "Richert"}
    stub_request(:get, endpoint).to_return(:body => body)
    connection.get("/").body.should == body
  end

  it "passes single-key, non-hash-value hashes" do
    body = {:name => "Steve Richert"}
    stub_request(:get, endpoint).to_return(:body => body)
    connection.get("/").body.should == body
  end

  it "deeply expands single-key, single-key-hash-value hashes" do
    body = {:customer => {:user => {:name => "Steve Richert"}}}
    stub_request(:get, endpoint).to_return(:body => body)
    connection.get("/").body.should == body[:customer][:user]
  end

  it "passes arrays" do
    body = ["foo", "bar"]
    stub_request(:get, endpoint).to_return(:body => body)
    connection.get("/").body.should == body
  end

  it "expands hashes within arrays" do
    body = [{:customer => {:name => "Steve Richert"}}]
    stub_request(:get, endpoint).to_return(:body => body)
    connection.get("/").body.should == [body.first[:customer]]
  end
end
