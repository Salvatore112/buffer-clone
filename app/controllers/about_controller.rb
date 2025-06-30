class AboutController < ApplicationController
  def index
    flash[:notice] = 'Notice flash in about controller'
    flash[:alert] = 'Alert flash in about controller'
  end
end
