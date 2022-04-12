class HomePagesController < ApplicationController
    def index
      @home_page = HomePage.find(1)
    end
    def show
    end
    def new
    end
    def edit
      @home_page = HomePage.find(1)
    end
    def update
      @home_page = HomePage.find(1)
      respond_to do |format|
        if @home_page.update(home_params)
          format.html { redirect_to home_pages_url, notice: "Home Page was successfully updated." }
          format.json { render :show, status: :ok, location: @home_page }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @home_page.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      def home_params
        params.require(:home_page).permit(:slider_image_1, :slider_image_2, :slider_image_3, :slider_image_4, :slider_image_5, :heading,:summary)
      end
  end