class AboutUsPagesController < ApplicationController
  def index
    @about_us_page = AboutUsPage.find(1)
  end
  def show
  end
  def new
  end
  def edit
    @about_us_page = AboutUsPage.find(1)
  end
  def update
    @about_us_page = AboutUsPage.find(1)
    respond_to do |format|
      if @about_us_page.update(about_us_params)
        format.html { redirect_to about_us_pages_url, notice: "About Us Page was successfully updated. " }
        format.json { render :show, status: :ok, location: @about_us_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @about_us_page.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def home_params
      params.require(:about_us_page).permit(:contents, :email)
    end
  end