require "spec_helper"

describe Chargify::Request do
  let :requestable do
    instance = Class.new(Object){ include Chargify::Request }.new
    instance.api_key = "key"
    instance.subdomain = "sub"
    instance
  end
  let!(:endpoint){ "https://key:x@sub.chargify.com/" }

  before do
    stub_request(:any, /^#{endpoint}/).to_return(:body => %(["bar"]))
  end

  it "gets" do
    requestable.get("foo")
    a_request(:get, "#{endpoint}foo").should have_been_made
  end

  it "gets with params" do
    requestable.get("foo", :baz => true)
    a_request(:get, "#{endpoint}foo?baz=true").should have_been_made
  end

  it "posts" do
    requestable.post("foo")
    a_request(:post, "#{endpoint}foo").should have_been_made
  end

  it "posts with params" do
    requestable.post("foo", :baz => true)
    a_request(:post, "#{endpoint}foo").
      with(:body =>%({"baz":true})).should have_been_made
  end

  it "puts" do
    requestable.put("foo")
    a_request(:put, "#{endpoint}foo").should have_been_made
  end

  it "puts with params" do
    requestable.put("foo", :baz => true)
    a_request(:put, "#{endpoint}foo").
      with(:body =>%({"baz":true})).should have_been_made
  end

  it "deletes" do
    requestable.delete("foo")
    a_request(:delete, "#{endpoint}foo").should have_been_made
  end

  it "deletes with params" do
    requestable.delete("foo", :baz => true)
    a_request(:delete, "#{endpoint}foo?baz=true").should have_been_made
  end
end
