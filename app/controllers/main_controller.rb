class MainController < ApplicationController
  def index
    flash[:notice] = 'Notice flash in main controller'
    flash[:alert] = 'Alert flash in main controller'
  end
end
