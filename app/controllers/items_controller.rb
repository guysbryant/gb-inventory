class ItemsController < ApplicationController 
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