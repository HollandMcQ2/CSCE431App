require 'rails_helper'
require 'semester'

RSpec.describe Semester, type: :model do
	describe 'CRUD' do
		describe 'Create' do
			it "has a creation page that can be accessed directly or indirectly from the Admin dashboard."
			it "has a form on the creation page allowing admins to describe a new semester."
			it "processes completed forms and adds a new record to the database if valid."
			it "fails gracefully when given invalid data and informs the user of the problem."
		end

		describe 'Read' do
			it "has an index page that can be accessed directly from the admin dashboard."
			it "has a page to display detailed information on each semester individually."
		end

		describe 'Update' do
			it "displays the edit form with current values filled in."
			it "processes edit forms and saves valid changes to the database."
			it "fails gracefully when given an update form with invalid information, and does not modify the database."
		end

		describe 'Delete' do
			it "displays a deletion confirmation page."
			it "removes the record from the database, but leaves it in a valid state."
		end
	end
end
