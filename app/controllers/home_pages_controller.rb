class HomePagesController < ApplicationController
    def index
    end
    def show
    end
    def edit
      @home_page = HomePage.find(params[:id])
    end
    def update
      @home_page = HomePage.find(params[:id])
      respond_to do |format|
        if @home_page.update(home_page_params)
          format.html { redirect_to home_pages_url, notice: "home_page was successfully updated." }
          format.json { render :show, status: :ok, location: @home_page }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @home_page.errors, status: :unprocessable_entity }
        end
      end
    end
    private
      def home_page_params
        params.require(:home_page).permit(:heading, :summary)
      end
  end