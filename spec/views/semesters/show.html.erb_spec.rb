require 'rails_helper'

RSpec.describe "semesters/show.html.erb", type: :view do
	before(:each) do
		assign(:semesters, [
			Semester.create!(
				name: "Spring 2022",
				start: Date.new(2022,1,16),
				end: Date.new(2022,5,7),
				duescost: 50.0
			)
		])
		@semester = Semester.first
	end

	it "displays the correct name" do
		render
		#puts @semester.name
		expect(rendered).to include("Name: "+@semester.name)
	end

	it "displays the correct start date" do
		render
		expect(rendered).to include(@semester.start.to_s)
	end
	it "displays the correct end date" do
		render
		expect(rendered).to include(@semester.end.to_s)
	end
	it "displays the correct dues cost" do
		render
		expect(rendered).to include(@semester.duescost.to_s)
	end
	xit "has a link to the edit form"
	it "has a link back to the index" do
		render
		expect(rendered).to include("<a class=\"mt-5\" href=\"/semesters\">")
	end
end
