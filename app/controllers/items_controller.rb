class ItemsController < ApplicationController 
    #add item to inventory
    get "/items/new" do 
        erb :"/items/new"
    end

    post "/items/new" do 
        #create item
        @item = Item.new(name: params[:name], user_id: current_user.id)

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

    #update an item 

    #delete an item
end