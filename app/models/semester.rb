class Semester < ApplicationRecord
	has_many :semester_user #creates relationship with semester-user join table
	validates :name, presence: true
	validates :start, presence: true
	validates :end, presence: true
end
