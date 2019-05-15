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
        erb :"signup"
    end

    post "/signup" do 
        #create user

        #add user to session and redirect or redirect to signup with flash message
    end

    #logout
    get "/logout" do 
        #clear session
    end
end