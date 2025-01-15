class DetailsController < ApplicationController
  # 詳細表示
  def show
    @list = List.find(params[:id])
    @items = @list.items # リストに関連するアイテムを取得
  end

  # アイテムの追加
  def create
    @list = List.find(params[:list_id]) # 親リストを取得
    @item = @list.items.build(item_params)
    if @item.save
      redirect_to detail_path(@list), notice: 'アイテムが追加されました。'
    else
      redirect_to detail_path(@list), alert: 'アイテムの追加に失敗しました。'
    end
  end

  # アイテムの削除
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to detail_path(@item.list), notice: 'アイテムが削除されました。'
  end

  private

  # Strong Parameters: アイテム用の安全なパラメータ設定
  def item_params
    params.require(:item).permit(:name, :quantity)
  end
end

