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

    def login_and_priveleged_access_required
        login_required
        priveleged?
    end

    def authorized?(id)
      get_department(id)
      if !current_user.departments.include?(@department)
        flash[:error] = "Not authorized to access this department"
        redirect "/"
      end
    end

    def access_granted?
      current_user.access_level == 0 if logged_in?
    end

    def priveleged? 
      flash[:error] = "You don't have the necessary priveleges to access this content."
      redirect "/department/index" unless access_granted?
    end

    def get_user(id)
      @user = User.find(id)
    end

    def get_item(id)
      @item = Item.find(id)
    end

    def get_department(id)
        @department = Department.find(id)
    end

    def get_item_and_department(item)
        get_item(item)
        get_department(@item.department.id)
    end
  end
end
