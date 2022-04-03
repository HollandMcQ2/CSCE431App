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

	def records
		@semester = Semester.find(params[:id])
		@records = SemesterUser.where(semester_id: @semester.id)
	end

	def new_record
		@record = SemesterUser.new
	end

	def create_record
		@record = SemesterUser.new(record_params)
		@record.semester_id = params[:id]
		respond_to do |format|
			if @record.save
				format.html {redirect_to records_semester_url, notice: "Record was successfully created."}
				format.json {render :show, status: :created, location: @record}
			else
				format.html {render :new_record, status: :unprocessable_entity}
				format.json {render json: @record.errors, status: :unprocessable_entity}
			end
		end
	end

	def edit_record
		@record = SemesterUser.where(semester_id: params[:id], user_id: params[:user_id]).first
	end

	def update_record
		@record = SemesterUser.find_by(semester_id: params[:id], user_id: record_params[:user_id])
		puts "===record_params[:paid_dues]===", record_params[:paid_dues]
		respond_to do |format|
			if @record.update(record_params)

				format.html {redirect_to records_semester_url, notice: "Record was successfully updated."}
				format.json {render :show, status: :ok, location: @record}
			else
				format.html {render :new_record, status: :unprocessable_entity}
				format.json {render json: @record.errors, status: :unprocessable_entity}
			end
		end
	end

	private
		def semester_params
			params.require(:semester).permit(:name,:start,:end,:duescost)
		end
		def record_params
			params.require(:semester_user).permit(:semester_id,:user_id,:paid_dues)
		end

end
