class AboutUsPage < ApplicationRecord
	validates :contents, presence: true
	validates :email, presence: true
	has_many :about_us_page_officer_bio # join table
end
