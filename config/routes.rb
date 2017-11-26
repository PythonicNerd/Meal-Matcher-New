Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'misc#home.html.erb'

  resource :login
  resource :registration
  resource :random_swipe do
    get :update_text, on: :collection
  end


  resource :prediction_swipe
  get '/home' => 'misc#home.html.erb'



end
