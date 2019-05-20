class ItemsController < ApplicationController 
    #add item to department inventory
    get "/department/:id/inventory/new" do 
        login_required
        @department = Department.find(params[:id])
        erb :"department/inventory/new"
    end

    post "/department/:id/inventory/new" do 
        login_required
        @department = Department.find(params[:id])
        @item = Item.create(name: params[:name], quantity: params[:quantity], details: params[:details], department_id: @department.id)
        redirect "/department/#{@department.id}/inventory/index"
    end

    #view department's inventory
    get "/department/:id/inventory/index" do 
        login_required
        @department = Department.find(params[:id])
        erb :"/department/inventory/index"
    end

    #view item details
    get "/department/inventory/item/:id" do 
        login_required
        @item = Item.find(params[:id])
        @department = Department.find(@item.department.id)
        erb :"/department/inventory/show"
    end

    #update item details
    patch "/department/inventory/item/:id/edit" do 
        login_required
        @item = Item.find(params[:id])
        @department = Department.find(@item.department.id)
        #get all department inventory except for the currently selected item
        department_inventory = @department.items.all.map{|item| item if item.name != @item.name}
        department_inventory.each do |item|
            #if the updated item name matches another item in this department's inventory
            if item && item.name == params[:name]
                #don't update and do redirect back to the index with a flash message
                flash[:error] = "Couldn't add item: Item already in inventory."
                redirect "/department/#{@department.id}/inventory/index"
            end
        end
        @item.update(name: params[:name], quantity: params[:quantity], details: params[:details], department_id: @department.id)
        redirect "/department/#{@department.id}/inventory/index" 
    end

    #delete an item
    delete "/department/inventory/item/:id" do 
        login_required
        @item = Item.find(params[:id])
        @department = Department.find_by(@item.department.id)
        @item.delete
        redirect "/department/#{@department.id}/inventory/index"
    end
end