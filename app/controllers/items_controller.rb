class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :ship_charge_id, :ship_area_id,
                                 :ship_date_id, :sales_price).merge(user_id: current_user.id)
  end
end
