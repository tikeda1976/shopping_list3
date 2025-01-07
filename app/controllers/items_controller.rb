class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      redirect_to root_path, alert: 'Item creation failed.'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path, notice: 'Item was successfully deleted.'
  end
end
