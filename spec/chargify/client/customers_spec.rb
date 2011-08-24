require "spec_helper"

describe Chargify::Client::Customers do
  let!(:endpoint){ "https://key:x@sub.chargify.com/" }
  let!(:attributes){ {:first_name => "Steve", :last_name => "Richert"} }

  before do
    Chargify.api_key = "key"
    Chargify.subdomain = "sub"
  end

  it "gets customers" do
    stub_request(:get, "#{endpoint}customers").
      to_return(:body => fixture("customers.json"))
    customers = Chargify.customers
    customers.should be_an(Array)
    customers.size.should == 1
    customers.first.first_name.should == "Steve"
  end

  it "gets a customer" do
    stub_request(:get, "#{endpoint}customers/800365").
      to_return(:body => fixture("customer.json"))
    customer = Chargify.customer(800365)
    customer.first_name.should == "Steve"
  end

  it "creates a customer" do
    stub_request(:post, "#{endpoint}customers").
      with(:body => {:customer => attributes}.to_json).
      to_return(:body => fixture("customer.json"))
    customer = Chargify.create_customer(attributes)
    customer.first_name.should == "Steve"
  end

  it "updates a customer" do
    stub_request(:put, "#{endpoint}customers/800365").
      with(:body => {:customer => attributes}.to_json).
      to_return(:body => fixture("customer.json"))
    customer = Chargify.update_customer(800365, attributes)
    customer.first_name.should == "Steve"
  end
end
