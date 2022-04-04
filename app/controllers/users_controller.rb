class UsersController < ApplicationController
  protect_from_forgery
  
  require "rubygems"
  require "braintree"
  # Before accessing any user routes, devise will check to see if the user is logged in. If not, they will be redirected to the sign in page.
  before_action :authenticate_user!
  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = ENV["MERCHANT_ID"]
  Braintree::Configuration.public_key = ENV["PUBLIC_KEY"]
  Braintree::Configuration.private_key = ENV["PRIVATE_KEY"]

  def index
    @users = User.order('full_name')
    @user = current_user
    @events = Event.all
    @event_users = EventUser.all
  end
  def show
    p current_user.id
    p params[:id]
    if current_user.id.to_f != params[:id].to_f
      p "redirect"
      redirect_to user_path(current_user.id)
    end
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
  # METHOD: GET
  # This method displays the payment portal for paying dues at the route /user/:id/payment. If the user has already paid their dues, this route will redirect the user to the thank you page with their receipt.
  def payment
    @user = User.find(params[:id])
    current_date = Date.today
    if @user[:has_paid_dues] == true
      redirect_to(thank_you_user_path(current_user.id))
    end
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
      # See result.transaction for details
      # TODO: change hasPaid on a per semester basis
      # redirect to thank you page
      p result.transaction
      @user.update_column("has_paid_dues", true);
      # update semester and join
      # need to determine current semester with time comparisons
      # then need to create new entity in semester_user
      @user.update_column("transaction_amount", result.transaction.amount)
      @user.update_column("transaction_last_4", result.transaction.credit_card_details.last_4.to_f);
      @user.update_column("transaction_date", result.transaction.created_at);
      # redirect to thank you
      redirect_to(thank_you_user_path(current_user.id))
    else
      # TODO: Handle error
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
  # METHOD: GET
  # This method display all the meetings a specific user has attended (or filtered by not attended)
  def meetings
    @user = User.find(params[:id])
    @events = Event.all
    @event_users = EventUser.all
    puts "I am user @view_meetings: #{@user.id}"
  end

  def edit_role
    @user = User.find(params[:id])
    if current_user.role == 'admin'
      respond_to do |format|
        if @user.update(edit_role_params)
          format.html { redirect_to users_url, notice: "User role was successfully updated: #{@user.role}."}
        end
      end
    end
  end
  private
  def edit_role_params
    params.require(@user).permit(:id, :role)
  end
end
