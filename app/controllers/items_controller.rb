class ItemsController < ApplicationController
  def index
  	@items = Item.all
  	render json: @items
  end
  def create
  	item = Item.new(item_params)
  	if item.save
  		render json: {:item => item, :message => 'error'}
  	else
  		render json: {:item => nil, :message => 'error'}
  	end
  end
  private
  def item_params
  	params.require(:item).permit(:action, :done)
  end
end
