require 'rails_helper'

RSpec.describe "semesters/index.html.erb", type: :view do
	before(:each) do
		assign(:semesters, [
			Semester.create!(
				name: "Spring 2020",
				start: Date.new(2022,1,16),
				end: Date.new(2022,5,7)
			),
			Semester.create!(
				name: "Spring 2020",
				start: Date.new(2022,1,16),
				end: Date.new(2022,5,7)
			)
		])
		assign(:users, [
			User.create!(
				full_name: "Jimbo Tester",
				email: "cringe@gmail.com",
				id: 1,
				role: "admin"
			)
		])
		assign(:current_user, User.first)
	end
	
	it "renders a list of Semesters" do
		render
		assert_select "tr", count: Semester.all.size+1 #each row plus the header
	end
	it "has a link back to the dashboard" do
		render
		expect(rendered).to include("<a class=\"mt-5\" href=\"/users/"+@user.id.to_s+"\">")
	end
end
