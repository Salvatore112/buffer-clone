class MainController < ApplicationController
  def index
    flash.now[:notice] = 'Notice flash in main controller'
    flash.now[:alert] = 'Alert flash in main controller'
  end
end
