class SemesterUser < ApplicationRecord
	belongs_to :semester
	belongs_to :user
end
