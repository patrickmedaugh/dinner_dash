class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:notice] = "Invalid item creation"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      flash[:notice] = "Invalid fields"
      render :edit
    end
  end

  def retire

  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :retired)
  end

end
