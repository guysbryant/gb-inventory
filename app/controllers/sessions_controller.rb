class SessionsController < ApplicationController
    #login
    get "/login" do 
        erb :"/sessions/login"
    end

    post "/login" do 
        #find the user in activerecord
        @user = User.find_by(username: params[:username])

        #authenticate user
        if @user && @user.authenticate(params[:password])
            session[:username] = @user.username
            redirect "/inventory/show/#{@user.id}"
        else
            flash[:error] = "Couldn't log you in with those credentials. Try again or create an account."
            redirect "/login"
        end

        #-add to session and redirect || redirect to login again
    end

    #signup
    get "/signup" do 
        erb :"/sessions/signup"
    end

    post "/signup" do 
        #create user
        @user = User.new(params)

        #add user to session and redirect or redirect to signup with flash message
        if @user.save
            session[:user] = @user.username
            redirect "/inventory/show/#{@user.id}"
        else
            flash[:error] = "Couldn't create the account: #{@user.errors.full_messages.to_sentence}"
            redirect "/signup"
        end
    end

    #logout
    get "/logout" do 
        #clear session
        session.clear
        redirect "/"
    end
end