require "spec_helper"

describe Chargify do
  it "claims to respond to client instance methods" do
    Chargify.instance_methods.should_not include(:customers)
    Chargify::Client.instance_methods.should include(:customers)
    Chargify.should respond_to(:customers)
  end

  it "delegates missing methods to a client instance" do
    Chargify.instance_methods.should_not include(:customer)
    Chargify::Client.instance_methods.should include(:customer)
    Chargify.client.should_receive(:customer).with(1)
    Chargify.customer(1)
  end

  it "lazy loads its client instance" do
    Chargify::Client.should_receive(:new)
    Chargify.client
  end

  it "memoizes its client instance" do
    id = Chargify.client.object_id
    Chargify.client.object_id.should == id
  end
end
