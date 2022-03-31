class HomePagesController < ApplicationController
    def index
    end
    def show
    end
    def new
      @homepage = HomePage.new
      puts "New HomePage Contents"
    end
    def edit
      @homepage = HomePage.find(params[:id])
    end
    def update
      @homepage = HomePage.find(params[:id])
    end
  end