class MainController < ApplicationController
  before_action :landing_page, only: [:login]
  def login
    session[:user_id] = nil
    @user = User.new
  end



end
