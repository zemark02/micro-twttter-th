class ApplicationController < ActionController::Base
  def landing_page
    @disable_nav = true
  end
end
