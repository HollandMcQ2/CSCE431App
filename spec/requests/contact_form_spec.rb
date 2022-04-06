require 'rails_helper'

RSpec.describe "ContactForms", type: :request do
	describe "GET /new" do
		it "returns http success" do
			get "/contact_forms/new"
			expect(response).to have_http_status(:success)
		end
	end

	describe "POST /#" do
		it "returns http found in response to a valid message" do
			post "/contact_forms", params: {contact_form: {message: "test"}}
			expect(response).to have_http_status(:found)
		end

		it "saves a valid submitted form to the database" do
			post contact_forms_path, params: {contact_form: {message: "this is a test message"}}

			expect(ContactForm.all.size).to eq(1)
		end

		it "gives feedback upon saving a valid submitted form" do
			HomePage.create!(id: 1, heading: "test page", summary: "test page")
			post "/contact_forms", params: {contact_form: {message: "test"}}
			follow_redirect!
			
			expect(response.body).to include("Message has been sent.")
		end

		it "returns users to the home page after a valid submission" do
			HomePage.create!(id: 1, heading: "test page", summary: "test page")
			post contact_forms_path, params: {contact_form: {message: "test"}}

			expect(response).to redirect_to(root_path)
		end

		it "returns http unprocessable entity in response to an invalid message" do
			post contact_forms_path, params: {contact_form: {message: ""}}

			expect(response).to have_http_status(:unprocessable_entity)
		end

		it "does not modify the database in response to an unprocessable entity" do
			initial_records = ContactForm.all
			post contact_forms_path, params: {contact_form: {message: ""}}

			expect(ContactForm.all).to eq(initial_records)
		end

		it "gives feedback about problems with invalid submitted messages" do
			post contact_forms_path, params: {contact_form: {message: ""}}

			expect(response.body).to include("prevented this message from being sent")
		end
	end

	describe "GET /index" do
		it "returns http success" do
			get "/contact_forms/index"
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET /show" do
		it "returns http success" do
			get "/contact_forms/show"
			expect(response).to have_http_status(:success)
		end
	end

end
