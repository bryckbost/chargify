# encoding: utf-8
require "spec_helper"

describe Faraday::Request::EncodeJson do
  let(:middleware){ described_class.new(proc{}) }

  it "ignores missing bodies" do
    env = {}
    middleware.call(env)
    env.should == {}
  end

  it "ignores nil bodies" do
    env = {:body => nil}
    middleware.call(env)
    env.should == {:body => nil}
  end

  it "encodes array bodies" do
    env = {:body => ["foo", "bar"]}
    middleware.call(env)
    env.should == {:body => %(["foo","bar"])}
  end

  it "encodes hash bodies" do
    env = {:body => {:foo => "bar"}}
    middleware.call(env)
    env.should == {:body => %({"foo":"bar"})}
  end
end
