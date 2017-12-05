class LoginsController < ApplicationController
  def show
    render 'login_page'
  end

  def create
    u = User.new(login_params)
    match = false

    User.all.each do |i|
      if u[:username].downcase == i[:username].downcase
        if u[:password] == i[:password]
          puts "We have a match! Woo hoo!"
          @logged_in = true
          @user = i
          Rails.application.config.user = @user
          match = true
        end
      end
    end



    if match
      redirect_to random_swipe_path
    else
      render 'login_error'
    end

  end

  def login_params
    params.require(:login).permit(:username,:password)
  end
end
