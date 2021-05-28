class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipCharge_id, :shipArea_id,
                                 :shipDate_id, :sales_price).merge(user_id: current_user.id)
  end
end
