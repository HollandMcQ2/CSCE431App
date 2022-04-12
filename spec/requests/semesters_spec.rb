require 'rails_helper'

RSpec.describe "Semesters", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/semesters/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/semesters/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/semesters/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/semesters/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/semesters/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
