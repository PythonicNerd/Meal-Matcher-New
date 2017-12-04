
#  $('#pricing').text(gon.vl.groups[0].items[rest_index].venue.price.message)
#  $('#type').text(gon.vl.groups[0].items[rest_index].venue.categories[0].name)


#<p>Logged in as: <%= @current_user[:username] %></p>
class RandomSwipesController < ApplicationController

  #:v=> '20170901'

  def create
    show()
  end

  def show

    @user = Rails.application.config.user

    if not defined? @user
      puts "@user is not defined"
      redirect_to login_path
    else

      begin


      z = Rails.application.config.user[:zip]
      @zipcode = Geocoder.coordinates(z)
        @venue_search = Foursquare2::Client.new(:client_id => 'SEIMTTT2VYZF0GQW45R4FBCU3Y2PXVAKP0BZRM3QTG1QGWM1', :client_secret => 'RPIHNXPALRNNX4ZG55SKFDOXH5NHCKZ3ZUKEZ1JKXDIZS0WA', :v=> '20170901').explore_venues(:ll => '%s,%s' % [@zipcode[0],@zipcode[1]], :section => 'food',:v=> '20170901')


      v = return_rest()
      @name_ = @venue_search.groups[0][:items][v][:venue][:name]

      #!!! venue_search.groups[0][:items][0][:venue]
      #venue_search.groups[0][:items][0][:venue][:name]
      #                               ^ Change for different restraunt


      @price = @venue_search.groups[0][:items][v][:venue][:price][:message]  #[:price][:message]

      @venuetype = @venue_search.groups[0][:items][v][:venue][:categories][0][:name] #venue type


      rest_lat_lng = [@venue_search.groups[0][:items][v][:venue][:location][:lat],@venue_search.groups[0][:items][v][:venue][:location][:lng]]

      @dist = Geocoder::Calculations.distance_between(@zipcode,rest_lat_lng)
      @dist = (@dist).round(2)



      @THIS_REST = @venue_search.groups[0][:items][v][:venue]
      Rails.application.config.rest = @THIS_REST
      for i in 0..40
        puts '\n'
      end


      Unsplash.configure do |config|
        config.application_id     = "006761deafcf11be889d6dcbe9fcaf1550c52b29a251f85cacaa0b52629cf585"
        config.application_secret = "5f9e1201b132a5f65d2e9440afae56889751e7c62e7cbc9cc2464e0a90b02c4f"
        config.application_redirect_uri = "https://your-application.com/oauth/callback"
        config.utm_source = "alices_terrific_client_app"
      end

      search_results = Unsplash::Photo.search(@venuetype)



      @url = search_results[0][:urls][:small]

      Rails.application.config.img_url = @url

      puts "URL"
      puts @url
      puts @url.class
      puts "br"


      render 'random_card_view'

    rescue
      redirect_to random_swipe_path
    end


    end
  end

  def return_rest
    z = Rails.application.config.user[:zip]
    @zipcode = Geocoder.coordinates(z)


    venue_search = Foursquare2::Client.new(:client_id => 'SEIMTTT2VYZF0GQW45R4FBCU3Y2PXVAKP0BZRM3QTG1QGWM1', :client_secret => 'RPIHNXPALRNNX4ZG55SKFDOXH5NHCKZ3ZUKEZ1JKXDIZS0WA', :v=> '20170901').explore_venues(:ll => '%s,%s' % [@zipcode[0],@zipcode[1]], :section => 'food',:v=> '20170901')



    vl = venue_search.groups

    return rand(vl[0][:items].length)
  end


  def update_text
    v = return_rest()
    z = Rails.application.config.user[:zip]
    zipcode = Geocoder.coordinates(z)
    @venue_search = Foursquare2::Client.new(:client_id => 'SEIMTTT2VYZF0GQW45R4FBCU3Y2PXVAKP0BZRM3QTG1QGWM1', :client_secret => 'RPIHNXPALRNNX4ZG55SKFDOXH5NHCKZ3ZUKEZ1JKXDIZS0WA', :v=> '20170901').explore_venues(:ll => '%s,%s' % [@zipcode[0],@zipcode[1]], :section => 'food',:v=> '20170901')
    @name_ = @venue_search.groups[0][:items][v][:venue][:name]
    @price = @venue_search.groups[0][:items][v][:venue][:price][:message]
    @venuetype = @venue_search.groups[0][:items][v][:venue][:categories][0][:name]
    rest_lat_lng = [@venue_search.groups[0][:items][v][:venue][:location][:lat],@venue_search.groups[0][:items][v][:venue][:location][:lng]]
    @dist = Geocoder::Calculations.distance_between(@zipcode,rest_lat_lng)
    @dist = (@dist).round(2)

    Unsplash.configure do |config|
      config.application_id     = "006761deafcf11be889d6dcbe9fcaf1550c52b29a251f85cacaa0b52629cf585"
      config.application_secret = "5f9e1201b132a5f65d2e9440afae56889751e7c62e7cbc9cc2464e0a90b02c4f"
      config.application_redirect_uri = "https://your-application.com/oauth/callback"
      config.utm_source = "alices_terrific_client_app"
    end

    search_results = Unsplash::Photo.search(@venuetype)



    @url = search_results[0][:urls][:small]





    puts @name_
    puts @price
    puts @venuetype
    puts @dist

    @THIS_REST = @venue_search.groups[0][:items][v][:venue]
    Rails.application.config.rest = @THIS_REST

    puts "URL"
    puts @url
    puts @url.class
    puts "br"

    data_array = [@name_,@price,@venuetype,@dist, @THIS_REST, @url]
    respond_to do |format|
        format.html
        format.json { render json: data_array }
    end
  end



helper_method :update_text
end
