require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "PaymentAccounts", type: :request do
	before(:each) do
    if PaymentAccount.all.empty?
      PaymentAccount.create!(internal_name: 'test', payment_address: 'test123')
    end
  end

  before(:example) do
    user = (User.all.empty?)?User.create(id: 1):User.first
    login_as(user, scope: :user)
  end

	describe "GET /new" do
    it "returns http success" do
      get "/payment_accounts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /payment_accounts/" do
    it "returns http success" do
      get "/payment_accounts/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /payment_accounts/:id" do
    it "returns http success" do
      get "/payment_accounts/"+PaymentAccount.first.id.to_s
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /payment_accounts/:id/edit" do
    it "returns http success" do
      get "/payment_accounts/"+PaymentAccount.first.id.to_s+"edit"
      expect(response).to have_http_status(:success)
    end
  end

end