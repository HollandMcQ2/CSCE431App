require 'rails_helper'

RSpec.describe "Semesters", type: :request do
  before(:context) do
    if Semester.all.empty?
      Semester.create!(name: 'test', start: DateTime.now(), end: DateTime.now())
    end
  end

  describe "GET /semesters/" do
    it "returns http success" do
      get "/semesters/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /semesters/:id" do
    it "returns http success" do
      get "/semesters/"+Semester.first.id.to_s
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/semesters/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /semesters/:id/edit" do
    it "returns http success" do
      get "/semesters/"+Semester.first.id.to_s+"/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /semesters/:id/delete" do
    it "returns http success" do
      get "/semesters/"+Semester.first.id.to_s+"/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
