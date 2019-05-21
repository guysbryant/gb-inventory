class UserController < ApplicationController
    get "/control-panel" do 
        priveleged?
        erb :"control-panel"
    end

    get "/user/new" do 
        erb :"user/new"
    end

    post "/user/new" do 
        @user = User.create(params)
        redirect "/"
    end

    get "/user/:id" do 
        priveleged?
        @user = User.find(params[:id])
        erb :"/user/show"
    end

    delete "/user/:id" do 
        priveleged?
        @user = User.find(params[:id])
        @user.delete 
        redirect "/control-panel"
    end

    patch "/user/:id/edit" do 
        priveleged?
        @user = User.find(params[:id])
        @user.access_level = params[:access_level]
        @user.save
        redirect "/control-panel"
    end

    patch "/user/:id/departments" do 
        priveleged?
        @user = User.find(params[:id])
        @user.departments.clear
        params[:departments].each do |department|
            @user.departments << Department.find(department)
        end
        @user.save
        redirect "/user/#{@user.id}"
    end


end