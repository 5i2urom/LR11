require 'rails_helper'

RSpec.describe "Seqs", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/seq/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/seq/show"
      expect(response).to have_http_status(:success)
    end
  end

end
