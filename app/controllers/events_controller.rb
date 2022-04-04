class EventsController < ApplicationController
    # For the actions outlined in the only: object, devise will check if the user trying to access the method is an admin. If not, they will be redirected to the home page.
    before_action :check_admin!, only: [:new, :create, :edit, :update, :delete, :destroy]
    def index
      @events = Event.order("time")
    end
    def show
      @event = Event.find(params[:id])
      @attendees = EventUser.where(event_id: @event.id)
      @users = User.all
    end
    def new
      @event = Event.new
    end
    def create
      @event = Event.new(event_params)
      puts @event.password
      respond_to do |format|
        if @event.save
          format.html { redirect_to events_url, notice: "Event was successfully created." }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
    def edit
      @event = Event.find(params[:id])
    end
    def update
      @event = Event.find(params[:id])
      respond_to do |format|
        if @event.update(event_params)
          format.html { redirect_to events_url, notice: "event was successfully updated." }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
    def delete
      @event = Event.find(params[:id])
    end
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
  
      respond_to do |format|
        format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
        format.json { head :no_content }
      end
    end
	def notify
		@event = Event.find(params[:id])
		#puts "===EVENT===", @event.name
	end
	def mail
		@event = Event.find(params[:id])
		@users = User.where(is_current_member: true)
		if params[:body].nil? || params[:body]==""
			@body = "Event reminder for "+@event.name+":\nTime:\t"+@event.time.to_s+"\nLocation:\t"+@event.location
		else
			@body = params[:body]
		end
		if params[:subject].nil? || params[:subject]==""
			@subject = "Event reminder for "+@event.name
		else
			@subject = params[:subject]
		end
		@users.each do |u|
			EventMailer.with(user: u, event: @event, body: @body, subject: @subject).event_notification.deliver_later
		end
	end
    private
      def event_params
        params.require(:event).permit(:name,:time,:location, :is_mandatory, :description, :password)
      end
	  def mailer_params
		params.require(:event).permit(:subject,:body)
	  end
  end
  