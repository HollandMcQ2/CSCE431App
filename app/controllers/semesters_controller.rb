class SemestersController < ApplicationController
	def index
		@semesters = Semester.all
	end

	def show
		@semester = Semester.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def delete
	end

	def destroy
	end
end
