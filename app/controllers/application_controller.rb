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
    if session[:username]
      redirect "/department/index"
    else
      erb :welcome
    end
  end

  helpers do 
    def current_user
      @current_user ||= User.find_by(username: session[:username])
    end

    def logged_in? 
      !!current_user
    end

    def login_required
      if !logged_in? 
        flash[:error] = "Must be logged in"
        redirect "/"
      end
    end
  end
end
