require "spec_helper"

describe Faraday::Response::ClientError do
  let!(:endpoint){ "http://example.com/" }
  let :connection do
    Faraday.new(:url => endpoint) do |builder|
      builder.use described_class
      builder.adapter :net_http
    end
  end

  it "is a little teapot" do
    stub_request(:get, endpoint).to_return(:status => 418)
    expect{ connection.get("/") }.to raise_error(Chargify::ImATeapot)
  end
end
