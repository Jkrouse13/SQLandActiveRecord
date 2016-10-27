class ItemsController < ApplicationController

  def index
    @items = Item.left_joins(:orders).group(:id).order("sum(quantity) DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.title = params[:item][:title]
    @item.description = params[:item][:description]
    @item.category = params[:item][:category]
    @item.price = params[:item][:price]
    if @item.save
    redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    render :new
  end

  def update
    @item = Item.find(params[:id])
    @item.title = params[:item][:title]
    @item.description = params[:item][:description]
    @item.category = params[:item][:category]
    @item.price = params[:item][:price]
    if @item.save
    redirect_to root_path
    else
      render :new
    end
  end

end
