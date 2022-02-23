require 'rails_helper'

RSpec.describe "Api::V1::LoggedIns", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/logged_in/show"
      expect(response).to have_http_status(:success)
    end
  end

end
