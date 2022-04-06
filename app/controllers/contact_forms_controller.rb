class ContactFormsController < ApplicationController
	def new
		@contact_form = ContactForm.new
	end

	def create
		
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
