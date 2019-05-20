class ItemsController < ApplicationController 
    #add item to department inventory
    get "/department/:id/inventory/new" do 
        @department = Department.find(params[:id])
        erb :"/items/new"
    end

    post "/department/inventory/new" do 
        @department = Department.find_by(name: params[:department_name])
        @item = Item.create(name: params[:name], quantity: params[:quantity], details: params[:details], department_id: @department.id)
        redirect "/department/show/#{@department.id}"
    end

    #add item to inventory
    get "/items/new" do 
        erb :"/items/new"
    end

    post "/items/new" do 
        #create item
        @item = Item.new(name: params[:name], quantity: params[:quantity], details: params[:details], department_id: department(params[:department_name]))
        # item_exists?(@item.name) 

        if @item.save
            redirect "/inventory/index"
            # redirect "/inventory/index/#{current_user.id}"
        else
            flash[:error] = "Couldn't add item: #{@item.errors.full_messages.to_sentence}"
            redirect "/items/new"
        end
    end

    #view all items in user's inventory
    get "/inventory/index" do 
        # @user = User.find(params[:id])
        erb :"/items/index"
    end

    get "/department/inventory/item/:id" do 
        @item = Item.find(params[:id])
        @department = Department.find(@item.department.id)
        erb :"/items/show"
    end

    patch "/department/inventory/item/:id" do 
        @item = Item.find(params[:id])
        @department = Department.find(@item.department.id)
        @item.update(name: params[:name], quantity: params[:quantity], details: params[:details], department_id: @department.id)
        redirect "/department/inventory/show" 
    end

    #view individual items' show page
    get "/inventory/item/:id" do 
        @item = Item.find(params[:id])
        erb :"/items/show"
    end

    #update an item 
    patch "/inventory/item/:id/edit" do 
        @item = Item.find(params[:id])
        # my_items = current_user.items.map{|item| item if item.name != @item.name}
        # my_items.each do |item|
        #     if item && item.name == params[:name]
        #         flash[:error] = "Couldn't add item: Item already in inventory."
        #         redirect "/inventory/item/#{@item.id}"
        #     end
        # end
        @item.update(name: params[:name], quantity: params[:quantity], details: params[:details], department_id: department(params[:department_name]))
        redirect "/inventory/index"
        # redirect "/inventory/index/#{current_user.id}"
    end


    #delete an item
    delete "/inventory/item/:id" do 
        @item = Item.find(params[:id])
        @item.delete
        redirect "/inventory/index/#{current_user.id}"
    end

end