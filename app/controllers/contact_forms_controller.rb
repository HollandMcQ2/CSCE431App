class ContactFormsController < ApplicationController
	def new
		@contact_form = ContactForm.new
	end

	def create
		@contact_form = ContactForm.new(form_params)
		respond_to do |format|
			if @contact_form.save
				format.html { redirect_to root_url, notice: "Message has been sent." }
        		format.json { render :show, status: :created, location: @contact_form }
			else
				format.html {render :new, status: :unprocessable_entity}
				format.json {render json: @contact_form.errors, status: :unprocessable_entity}
			end
		end
	end

	def index
	end

	def show
	end

	def destroy
	end

	private
		def form_params
			params.require(:contact_form).permit(:name, :email, :company, :message)
		end
	
end
