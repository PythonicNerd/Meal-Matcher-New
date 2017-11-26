class LoginsController < ApplicationController
  def show
    render 'login_page'
  end

  def create
    u = User.new(login_params)
    match = false

    User.all.each do |i|
      if u[:username] == i[:username]
        if u[:password] == i[:password]
          puts "We have a match! Woo hoo!"
          @logged_in = true
          @user = i
          Rails.application.config.user = @user
        end
      end
    end

    puts @user[:username]

    redirect_to random_swipe_path
  end

  def login_params
    params.require(:login).permit(:username,:password)
  end
end
