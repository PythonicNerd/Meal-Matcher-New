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

    render 'index'
  end
end
