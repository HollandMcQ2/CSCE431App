class UsersController < ApplicationController
  def index
  end
  def show
  end
  def new
    @user = User.new
  end
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
