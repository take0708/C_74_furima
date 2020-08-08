class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.includes(:item_imgs).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_imgs.new
  end

  def create
    @item = Item.new(item_params) 
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
end

private

def item_params
  params.require(:item).permit(
    :name, 
    :item_explanation,
    :price, :dealing,
    :shipping_area,
    :brand_id,
    :category_id,
    :item_condition_id,
    :shipping_method_id,
    :shipping_cost_id,
    :shipping_day_id,
    :item_size_id,
    :seller_id,
    :buyer_id,
    item_imgs_attributes: [:image, :_destroy, :id])
end

def set_item
  @item = Item.find(params[:id])
end