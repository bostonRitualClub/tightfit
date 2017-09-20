class WelcomeController < ApplicationController
  def index
    render "welcome/index"
  end

  # def about
  #   render "homes/about"
  # end

  def premium_access
    render "welcome/premium_access"
  end
end
