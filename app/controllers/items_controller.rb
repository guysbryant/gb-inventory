class ItemsController < ApplicationController 
    #add item to inventory

    #view all items in user's inventory
    get "/inventory/show/:id" do 
        @user = User.find(params[:id])
        erb :"/items/show"
    end

    #update an item 

    #delete an item
end