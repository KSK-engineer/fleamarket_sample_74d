class ItemsController < ApplicationController
  def index
  end

  def new
    @address = Prefecture.all
  end
  
  def show
  end
end
