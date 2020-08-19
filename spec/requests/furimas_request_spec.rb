require 'rails_helper'

RSpec.describe "Furimas", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/furimas/index"
      expect(response).to have_http_status(:success)
    end
  end

end
