class UserController < ApplicationController
    get "/control-panel" do 
        erb :"control-panel"
    end

    get "/user/:id" do 
        @user = User.find(params[:id])
        erb :"/user/show"
    end

    delete "/user/:id" do 
        @user = User.find(params[:id])
        @user.delete 
        redirect "/control-panel"
    end

    patch "/user/:id/departments" do 
        @user = User.find(params[:id])
        @user.departments.clear
        params[:departments].each do |department|
            @user.departments << Department.find(department)
        end
        @user.save
        redirect "/user/#{@user.id}"
    end
end