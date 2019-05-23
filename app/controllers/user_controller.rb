class UserController < ApplicationController
    get "/control-panel" do 
        login_and_priveleged_access_required
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
        login_and_priveleged_access_required
        get_user(params[:id])
        erb :"/user/show"
    end

    delete "/user/:id" do 
        login_and_priveleged_access_required
        get_user(params[:id])
        @user.delete 
        redirect "/control-panel"
    end

    patch "/user/:id/edit" do 
        login_and_priveleged_access_required
        get_user(params[:id])
        @user.access_level = params[:access_level]
        @user.save
        redirect "/control-panel"
    end

    patch "/user/:id/departments" do 
        login_and_priveleged_access_required
        get_user(params[:id])
        @user.departments.clear
            params[:departments].each do |department|
                @user.departments << Department.find(department)
            end if params[:departments]
        @user.save
        redirect "/user/#{@user.id}"
    end
end