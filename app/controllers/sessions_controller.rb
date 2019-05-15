class SessionsController < ApplicationController
    #login
    get "/login" do 
        erb :"login"
    end

    post "/login" do 
        #find the user in activerecord

        #authenticate user

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