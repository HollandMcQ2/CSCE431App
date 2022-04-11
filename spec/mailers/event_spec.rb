require "rails_helper"
#require "test_helper"

RSpec.describe EventMailer, type: :mailer do
	
	before(:context) do
		User.create!([
			full_name: "John Knapp",
			email: "jmichaelknapp@gmail.com",
			role: "admin"
		])
		Event.create!(
			:name => 'Test Event',
			:password => "testEventPassword",
			:description => 'This is a test event',
			:time => '2022-03-04',
			:link => "www.google.com",
			:location => 'Test Location',
			:is_mandatory => true,
			:is_recurring => false
		);
		@event = Event.all.first
	end

	before(:example) do
		@user = User.find_by(full_name: "John Knapp")
		#p @user
	end

	after(:example) do
		ActionMailer::Base.deliveries.clear
	end

	after(:context) do
		User.find_by(full_name: "John Knapp").destroy!
	end

	it "can create a test email and send it internally" do
		email = EventMailer.test_email(@user)

		email.deliver_now
		expect(ActionMailer::Base.deliveries.size).to eq(1)
	end

	it "can accept parameters via Controller call", type: :request do
		post notify_event_path(@event.id), params: {}
		expect(ActionMailer::Base.deliveries.size).to eq(1)
		#puts ActionMailer::Base.deliveries.last.body.to_s
	end

	it "sends the correct subject and contents to the correct address", type: :request do
		post notify_event_path(@event.id), params: {}
		mail = ActionMailer::Base.deliveries.last
		expect(mail.to).to include(@user.email)
		expect(mail.subject).to match(@event.name)
		expect(mail.body).to match(@event.time.to_s)
		expect(mail.body).to match(@event.location)
	end

	it "allows the subject and body to be passed in via post request", type: :request do
		post notify_event_path(@event.id), params: {
			subject: "Secret Event Notification",
			body: "This is a notification for an event, but it's secret, so I can't tell you what it is."
		}
		mail = ActionMailer::Base.deliveries.last
		expect(mail.subject).to eq("Secret Event Notification")
		expect(mail.body).to eq("This is a notification for an event, but it's secret, so I can't tell you what it is.")
	end

end
