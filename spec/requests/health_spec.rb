require 'rails_helper'

RSpec.describe "Healths", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/health/index"
      # expect(response).to have_http_status(:success)
      expect(response.body).to eq('{"status":"online"}')
      
      # we can also check the http status of the response
      expect(response.status).to eq(200)
    end
  end

end
