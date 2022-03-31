require 'rails_helper'
require 'semester'
require 'date'

RSpec.describe Semester, type: :model do
	subject do
		described_class.new(
			name: 'Spring 2022',
			start: Date.new(2022,1,16),
			end: Date.new(2022,5,7),
			duescost: 50.00
		)
	end

	it "is valid with valid data" do
		expect(subject).to be_valid
	end
	it "is invalid without a name" do
		old_name = subject.name
		subject.name = nil
		expect(subject).not_to be_valid
		subject.name = old_name
	end
	it "is invalid without a start date" do
		old_start = subject.start
		subject.start = nil
		expect(subject).not_to be_valid
		subject.name = old_start
	end
	it "is invalid without an end date" do
		old_end = subject.end
		subject.end = nil
		expect(subject).not_to be_valid
		subject.end = old_end
	end

	it "can be saved in the database when valid" do
		subject.save
		expect(Semester.all).not_to be_empty
	end
	it "can be retrieved from the database" do
		subject.save
		@semester = Semester.all.first
		expect(@semester).not_to be_nil
	end
	it "can be modified and saved to the database" do
		subject.save
		@semester = Semester.last
		@semester.duescost = 100.0
		@semester.save
		expect(Semester.last.duescost).to eq(100.0)
	end
end
