class PaymentAccountsController < ApplicationController
	def new
		@account = PaymentAccount.new
	end

	def create
		@account = PaymentAccount.new(account_params)
		respond_to do |format|
			if @account.save
				format.html {redirect_to payment_accounts_path, notice: "Account was successfully created."}
				format.json {render :show, status: :created, location: @account}
			else
				format.html {render :new, status: :unprocessable_entity}
				format.json {render json: @account.errors, status: :unprocessable_entity}
			end
		end
	end

	def index
		@semesters = Semester.where(["semesters.start < :now AND semesters.end > :now", {now: DateTime.now}]).order(created_at: :desc)

		@accounts = PaymentAccount.all
	end

	def show
		@account = PaymentAccount.find(params[:id])
	end

	def edit
		@account = PaymentAccount.find(params[:id])
	end

	def update
		@account = PaymentAccount.find(params[:id])
		respond_to do |format|
			if @account.update(account_params)
				format.html {redirect_to payment_accounts_path, notice: "Account was successfully updated."}
				format.json {render :show, status: :ok, location: @account}
			else
				format.html {render :edit, status: :unprocessable_entity}
				format.json {render json: @account.errors, status: :unprocessable_entity}
			end
		end
	end

	def destroy
		@account = PaymentAccount.find(params[:id])
		@account.destroy
		respond_to do |format|
			format.html {redirect_to payment_accounts_path, notice: "Account was successfully deleted."}
			format.json {head :no_content}
		end
	end

	def select
		@account = PaymentAccount.find(params[:id])
		puts "This function is a stub pending necessary implementation details of payment processing"
		respond_to do |format|
			format.html {redirect_to payment_accounts_path, notice: "Account was selected as payment destination*."}
			format.json {head :no_content}
		end
	end

	private
		def account_params
			params.require(:payment_account).permit(:internal_name, :payment_address)
		end
end
