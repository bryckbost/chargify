require "spec_helper"

describe Faraday::Response::ServerError do
  let!(:endpoint){ "http://example.com/" }
  let :connection do
    Faraday.new(:url => endpoint) do |builder|
      builder.use described_class
      builder.adapter :net_http
    end
  end

  it "catches bombs" do
    stub_request(:get, endpoint).to_return(:status => 500)
    expect{ connection.get("/") }.to raise_error(Chargify::InternalServerError)
  end
end
