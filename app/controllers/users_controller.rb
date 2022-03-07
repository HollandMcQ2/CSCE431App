class UsersController < ApplicationController
  protect_from_forgery
  require "rubygems"
  require "braintree"

  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = ENV["MERCHANT_ID"]
  Braintree::Configuration.public_key = ENV["PUBLIC_KEY"]
  Braintree::Configuration.private_key = ENV["PRIVATE_KEY"]

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    puts "I am user @HomePage: #{@user.id}"
  end
  def new
    @user = User.new
    puts "I am user @Events: #{@user.id}"
  end
  def edit
    @user = User.find(params[:id])
    @role = @user.role
    puts "edit test"
    puts "I am user @attendance: #{@user.id}"
    puts "current user role: #{@user.role}"
  end
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      puts params[:user]
      puts params[:user]['password']

      # get the most recently created event with this password
      # this allows passwords to be reused
      @event = Event.where(password: params[:user]['password']).last
      # if password is valid for a meeting
      if @event
        @user.increment!(:attendance_count)
        @event.increment!(:attendance_count)
        @event_user = EventUser.create(:user_id => @user.id, :event_id => @event.id, :attended => true)

        if @user.save && @event.save && @event_user.save
          format.html { redirect_to user_path(current_user.id), notice: "Attendance was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else # if the user inputs an invalid password
        flash.now[:error] = "Invalid email/password combination"
        format.html { render :edit, status: :unprocessable_entity  }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def payment
    @user = User.find(params[:id])
    current_date = Date.today
    # loop through all semesters and collect the dates to use as start and end in this query
    # @semester = Semester.where("? BETWEEN start AND end", current_date)
    # p @semester
    if @user[:has_paid_dues] == true
      redirect_to(thank_you_user_path(current_user.id))
    end
    # if user has paid == true, redirect to thank you page
    @client_token = Braintree::ClientToken.generate
  end

  # METHOD: POST
  # This method processes the transaction from the /user/:id/payment route. If the transaction is successful, attributes in the user model will be updated to store basic, non invasive information to provide the user with a reciept on the thank you page.
  # In the future, this method will map hasPaid values to individual semesters so that when a new semeseter starts, users will have to repay dues.
  def checkout
    @user = User.find(params[:id])
    nonce = params[:nonce]
    p "nonce: "
    p nonce
    result = Braintree::Transaction.sale(
      :amount => "200.00",
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )
    if result.success?
      p result.transaction
      @user.update_column("has_paid_dues", true);
      @user.update_column("transaction_amount", result.transaction.amount)
      @user.update_column("transaction_last_4", result.transaction.credit_card_details.last_4.to_f);
      @user.update_column("transaction_date", result.transaction.created_at);
      redirect_to(thank_you_user_path(current_user.id))
    else
      p result.message
      render json: {status: "error", code: 400, message: result.message}
    end
  end
  def thank_you
    @user = User.find(params[:id])
    if @user[:has_paid_dues] == false
      redirect_to(payment_user_path(current_user.id))
    end
    # this may not work with paypal
    
    p "transaction info:"
    p @user[:transaction_amount]
    p @user[:transaction_last_4]
  end
  #  make edit the attendance route
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to user_url(@user), notice: "user was successfully created." }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # private
  #   def user_params
  #     params.require(:user).permit(:name,:email,:password)
  #   end
end

