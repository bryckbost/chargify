require "spec_helper"

describe Faraday::Request::EncodeJson do
  let(:middleware){ described_class.new(proc{}) }

  it "ignores missing bodies" do
    env = {}
    middleware.call(env)
    env.should == {}
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

  context "unnecessarily" do
    it "encodes string bodies" do
      env = {:body => "foo"}
      middleware.call(env)
      env.should == {:body => %("foo")}
    end

    it "encodes integers" do
      env = {:body => 1}
      middleware.call(env)
      env.should == {:body => %(1)}
    end

    it "encodes floats" do
      env = {:body => 1.0}
      middleware.call(env)
      env.should == {:body => %(1.0)}
    end

    it "encodes true" do
      env = {:body => true}
      middleware.call(env)
      env.should == {:body => %(true)}
    end

    it "encodes false" do
      env = {:body => false}
      middleware.call(env)
      env.should == {:body => %(false)}
    end

    it "encodes nil" do
      env = {:body => nil}
      middleware.call(env)
      env.should == {:body => %(null)}
    end
  end
end
