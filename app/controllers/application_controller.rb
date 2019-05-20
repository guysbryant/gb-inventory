require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"

    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def current_user
      @current_user ||= User.find_by(username: session[:username])
    end

    def item_exists?(item_name)
      current_user.items.each do |item|
        if item_name == item.name 
          flash[:error] = "Couldn't add item: Item already in inventory."
          redirect "/items/new"
        end
      end
    end
  end
end
