class EventsController < ApplicationController
    def index
      @events = Event.order("time")
    end
    def show
      @event = Event.find(params[:id])
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
        format.html { redirect_to events_url, notice: "event was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      def event_params
        params.require(:event).permit(:name,:time,:location, :is_mandatory, :description, :password)
      end
  end
  