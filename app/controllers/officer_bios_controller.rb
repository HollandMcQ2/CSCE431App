lass OfficerBiosController < ApplicationController
    # For the actions outlined in the only: object, devise will check if the user trying to access the method is an admin. If not, they will be redirected to the home page.
    before_action :check_admin!, only: [:new, :create, :edit, :update, :delete, :destroy]
    def index
      @officer_bios = OfficerBio.all
    end
    def show
      @officer_bio = OfficerBio.find(params[:id])
    end
    def new
      @officer_bio = OfficerBio.new
    end
    def create
      @officer_bio = OfficerBio.new(officer_bio_params)
      respond_to do |format|
        if @officer_bio.save
          format.html { redirect_to officer_bios_url, notice: "Officer Bio was successfully created." }
          format.json { render :show, status: :created, location: @officer_bio }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @officer_bio.errors, status: :unprocessable_entity }
        end
      end
    end
    def edit
      @officer_bio = OfficerBio.find(params[:id])
    end
    def update
      @officer_bio = OfficerBio.find(params[:id])
      respond_to do |format|
        if @officer_bio.update(officer_bio_params)
          format.html { redirect_to officer_bios_url, notice: "officer_bio was successfully updated." }
          format.json { render :show, status: :ok, location: @officer_bio }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @officer_bio.errors, status: :unprocessable_entity }
        end
      end
    end
    def delete
      @officer_bio = OfficerBio.find(params[:id])
    end
    def destroy
      @officer_bio = OfficerBio.find(params[:id])
      @officer_bio.destroy
  
      respond_to do |format|
        format.html { redirect_to officer_bios_url, notice: "Officer Bio was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      def officer_bio_params
        params.require(:officer_bio).permit(:full_name,:bio_text, :portrait_image)
      end
  end
  