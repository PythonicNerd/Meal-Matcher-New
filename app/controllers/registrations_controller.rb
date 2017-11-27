class RegistrationsController < ApplicationController

  def show
    render 'registration_page'
  end


  def create
    u = User.new(reg_params)
    puts u[:username]

    @duplicate = false



    User.all.each do |x|
      if u[:username] == x[:username]
        @duplicate = true
      end
    end

    if @duplicate == false
      u.save
    end

    User.all.each do |u|
      puts u[:username]
    end


    if @duplicate == true
      for i in 0..30
        puts "DUPLICATEEE"
      end
    end
    @user = u

    if @duplicate == false
      render 'logins/login_page'
    else
      render 'regerror'
    end
  end

  def reg_params
    params.require(:registration).permit(:username,:password,:zip)
  end
end
