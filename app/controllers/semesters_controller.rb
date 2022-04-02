class SemestersController < ApplicationController
	def index
		@semesters = Semester.all
	end

	def show
		@semester = Semester.find(params[:id])
	end

	def new
		@semester = Semester.new
	end

	def create
		@semester = Semester.new(semester_params)
		respond_to do |format|
			if @semester.save
				format.html {redirect_to semesters_url, notice: "Semester was successfully created."}
				format.json {render :show, status: :created, location: @semester}
			else
				format.html {render :new, status: :unprocessable_entity}
				format.json {render json: @semester.errors, status: :unprocessable_entity}
			end
		end
	end

	def edit
		@semester = Semester.find(params[:id])
	end

	def update
		@semester = Semester.find(params[:id])
		respond_to do |format|
			if @semester.update(semester_params)
				format.html {redirect_to semesters_url, notice: "Semester was successfully updated."}
				format.json {render :show, status: :ok, location: @semester}
			else
				format.html {render :edit, status: :unprocessable_entity}
				format.json {render json:@semester.errors, status: :unprocessable_entity}
			end
		end
	end

	def delete
		@semester = Semester.find(params[:id])
	end

	def destroy
		@semester = Semester.find(params[:id])
		@semester.destroy
		respond_to do |format|
			format.html {redirect_to semesters_url, notice: "Semester was successfully destroyed."}
			format.json {head :no_content}
		end
	end

	private
		def semester_params
			params.require(:semester).permit(:name,:start,:end,:duescost)
		end

end
