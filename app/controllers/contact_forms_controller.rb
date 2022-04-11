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
		@forms = ContactForm.order(created_at: :desc)
	end

	def show
		@form = ContactForm.find(params[:id])
	end

	def destroy
		@form = ContactForm.find(params[:id])
		@form.destroy

		respond_to do |format|
			format.html {redirect_to contact_forms_url, notice: "Message was successfully deleted."}
			format.json {head :no_content}
		end
	end

	private
		def form_params
			params.require(:contact_form).permit(:name, :email, :company, :message)
		end
	
end
