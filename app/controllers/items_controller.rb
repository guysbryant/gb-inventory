class ItemsController < ApplicationController 
    #add item to inventory
    get "/items/new" do 
        erb :"/items/new"
    end

    post "/items/new" do 
        #create item
        @item = Item.new(params)

        if @item.save
            redirect "/inventory/show/#{current_user.id}"
        else
            flash[:error] = "Couldn't add item: #{@item.errors.full_messages.to_sentence}"
            redirect "/items/new"
        end

    end

    #view all items in user's inventory
    get "/inventory/show/:id" do 
        @user = User.find(params[:id])
        erb :"/items/show"
    end

    #update an item 

    #delete an item
end