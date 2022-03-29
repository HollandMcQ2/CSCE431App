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
    end
  end