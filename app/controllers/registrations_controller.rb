class RegistrationsController < ApplicationController
#t.string :swiped_right, array: true, default: []
#t.string :swiped_left, array: true, default: []
  def show
    render 'registration_page'
  end


  def create
    u = User.new(reg_params)
    puts u[:username]
    u.save

    User.all.each do |u|
      puts u[:username]
    end

    @user = u

    render 'logins/login_page'
  end

  def reg_params
    params.require(:registration).permit(:username,:password,:zip)
  end
end
