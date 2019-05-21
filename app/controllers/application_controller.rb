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
    if logged_in?
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

    def authorized?(id)
      @department = Department.find(id)
      if !current_user.departments.include?(@department)
        flash[:error] = "Not authorized to access this department"
        redirect "/"
      end
    end

    def access_granted?
      current_user.access_level == 0 if logged_in?
    end

    def priveleged? 
      redirect "/department/index" unless access_granted?
    end
  end
end
