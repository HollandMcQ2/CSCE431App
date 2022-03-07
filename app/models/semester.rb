class Semester < ApplicationRecord
	has_many :semester_user #creates relationship with semester-user join table
end
