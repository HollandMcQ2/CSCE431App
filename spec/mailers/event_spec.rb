require "rails_helper"
#require "test_helper"

RSpec.describe EventMailer, type: :mailer do
	
	before(:context) do
		User.create!([
			full_name: "John Knapp",
			email: "jmichaelknapp@gmail.com",
			role: "admin"
		])
	end

	before(:example) do
		@user = User.find_by(full_name: "John Knapp")
		p @user
	end

	after(:context) do
		User.find_by(full_name: "John Knapp").destroy!
	end

	it "can create a test email and send it internally" do
		email = EventMailer.test_email(@user)

		email.deliver_now
		expect(ActionMailer::Base.deliveries.size).to eq(1)
	end

	it "can accept parameters via Controller call"

end
