class DepartmentController < ApplicationController
    get "/department/new" do 
        login_required
        erb :"department/new"
    end

    post "/department/new" do 
        login_required
        @department = Department.new(name: params[:name])
        if @department.save
            redirect "/department/#{@department.id}"
        else
            flash[:error] = "Couldn't create department: #{@department.errors.full_messages.to_sentence}"
            redirect "/department/new"
        end
    end

    get "/department/index" do 
        login_required
        erb :"department/index"
    end

    get "/department/:id" do 
        login_required
        authorized?(params[:id])
        @department = Department.find(params[:id])
        erb :"/department/show"
    end
    
    get "/department/:id/edit" do 
        login_required
        @department = Department.find(params[:id])
        erb :"/department/update"
    end

    patch "/department/:id/edit" do 
        login_required
        @department = Department.find(params[:id])
        Department.all.each do |department|
            if department && department.name == params[:name]
                flash[:error] = "That department already exists."
                redirect "/department/#{@department.id}"
            end
        end
        @department.update(name: params[:name])
        redirect "/department/#{@department.id}"
    end

    delete "/department/:id" do 
        login_required
        @department = Department.find(params[:id])
        @department.delete
        redirect "department/index"
    end
end