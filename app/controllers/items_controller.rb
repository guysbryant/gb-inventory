class ItemsController < ApplicationController 
    #add item to inventory
    get "/items/new" do 
        erb :"/items/new"
    end

    post "/items/new" do 
        #create item
        @item = Item.new(name: params[:name], user_id: current_user.id)
        item_exists?(@item.name) 

        if @item.save
            redirect "/inventory/index/#{current_user.id}"
        else
            flash[:error] = "Couldn't add item: #{@item.errors.full_messages.to_sentence}"
            redirect "/items/new"
        end

    end

    #view all items in user's inventory
    get "/inventory/index/:id" do 
        @user = User.find(params[:id])
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
        item_exists?(@item.name) 
        @item.update(name: params[:name])
        redirect "/inventory/index/#{current_user.id}"
    end


    #delete an item
    delete "/inventory/item/:id" do 
        @item = Item.find(params[:id])
        @item.delete
        redirect "/inventory/index/#{current_user.id}"
    end

end