class OfficerBio < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :about_us_page
end
