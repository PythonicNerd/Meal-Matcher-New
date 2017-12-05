class AdminsController < ApplicationController

  def show

    render 'login'

  end

  def create

  u = params.require(:admin_login).permit(:username,:password)
  if u[:username] == "neil" and u[:password] == "991319"
    render "view"
  end
end
end
