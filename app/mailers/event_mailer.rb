class EventMailer < ApplicationMailer

	def test_email(user)
		mail(to: user.email, subject: "Test Email", body: "Test email.")
	end

	def event_notification
		@user = params[:user]
		mail(to: @user.email, subject: params[:subject], body: params[:body])
	end

end
