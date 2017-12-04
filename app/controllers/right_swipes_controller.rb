class RightSwipesController < ApplicationController

  def show

    render 'index'
  end


  def create

    # TODO
    # => Ratings
    # => Picture
    # => Link to Website
    # => Phone Number
    # => Hours
    # => Menu URL
    # => Address
    # => Is Open?

    #rating: r[:price][:rating]
    #photos: r[:menu][:photos] (may not be any)
    #link: NONE
    #Phone Number: r[:contact][:formattedPhone]
    #Hours: r[:hours][:text]
    #Menu: r[:menu][:url] NOTE: Theres is a hasMenu boolean in r[:contact][:hasMenu]
    #Address: r[:contact][:location][:address]
    #Is Open: r[:hours][:isOpen]


    @THIS_REST = Rails.application.config.rest

    begin
    @name = @THIS_REST[:name]
  rescue

  end
    begin
    @rating = "Rating " + @THIS_REST[:rating].to_s
  rescue
    @rating = ""
  end
    begin
    @p_s = @THIS_REST[:price][:stats]
  rescue
    @p_s = ""
  end
    begin
    @phone = "Phone:" + @THIS_REST[:contact][:formattedPhone].to_s
  rescue
    @phone = ""
  end
    begin
    @hours = @THIS_REST[:hours][:richStatus][:text]
  rescue
    @hours = ""
  end
    begin
    @address = "Address: " + @THIS_REST[:location][:address].to_s
  rescue
    @address = ""
  end


  begin
    @url__ = @THIS_REST[:menu][:url]
  rescue
    @url__ = ""
  end

    render 'index'
  end



  def redirect_random_swipe
    redirect_to "random_swipes/random_card_view"
  end
end
