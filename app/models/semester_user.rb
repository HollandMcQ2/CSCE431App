class SemesterUser < ApplicationRecord
	belongs_to :semester
	belongs_to :user

	validates_uniqueness_of :semester_id, scope: :user_id
	validates_uniqueness_of :user_id, scope: :semester_id
end
