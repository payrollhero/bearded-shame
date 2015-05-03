require 'rails_helper'

describe Shave::API do
  describe "GET /api/shaves/price" do
    it "returns an empty array of price" do
      get "/api/shaves/price"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq []
    end
  end
end
