class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /items
  def index
    @items = Item.all

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(Uploader.upload(item_params))
    @item.user = current_user

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /items/1
  def update
    if @item.update(Uploader.upload(item_params))
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.permit(:title, :brand, :super_type, :sub_type, :location, :short_description, :price, :full_description, :user_id, :base64, watcher_ids:[])
    end
end
