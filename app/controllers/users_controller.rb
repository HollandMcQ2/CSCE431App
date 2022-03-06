class UsersController < ApplicationController
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
