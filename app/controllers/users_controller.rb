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
  end
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
    puts "edit test"
    puts @user.role
  end
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      puts params[:user]
      puts params[:user]['password']
      @event = Event.find_by(password: params[:user]['password'])
      puts "event"
      puts @event.password
      if @event
        @user.increment!(:attendance_count)
        @event.increment!(:attendance_count)
        if @user.save && @event.save
          format.html { redirect_to user_path(@user), notice: "Attendance was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def payment
    @user = User.find(params[:id])
    @client_token = Braintree::ClientToken.generate
  end

  def checkout
    @user = User.find(params[:id])
    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
      :amount => "100.00",
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )
    if result.success?
      # See result.transaction for details
      # TODO: change hasPaid on a per semester basis
      p result.transaction
      @user.update_column("has_paid_dues", true);
    else
      # TODO: Handle error, ideally they stay on the payment page if the payment is unsuccessful, but we can also take them back to the payment page. right now the submit button for the drop in does 2 things at the same time: confirms payment submission and payment method, need to separate (change drop in container button positioning, add second submit button to the whole form and post request)
      p result.message
    end
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
