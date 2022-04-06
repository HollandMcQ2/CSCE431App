require 'rails_helper'

RSpec.describe "ContactForms", type: :request do
	describe "GET /new" do
		it "returns http success" do
			get "/contact_form/new"
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET /index" do
		it "returns http success" do
			get "/contact_form/index"
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET /show" do
		it "returns http success" do
			get "/contact_form/show"
			expect(response).to have_http_status(:success)
		end
	end

end
