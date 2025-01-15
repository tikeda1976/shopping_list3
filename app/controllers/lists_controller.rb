class ListsController < ApplicationController
  # 一覧表示
  def index
    @lists = List.all
  end

  # リストの追加
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path, notice: 'リストが追加されました。'
    else
      render :index, alert: 'リストの追加に失敗しました。'
    end
  end

  # リストの削除
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, notice: 'リストが削除されました。'
  end

  private

  # Strong Parameters: 安全なパラメータの設定
  def list_params
    params.require(:list).permit(:title)
  end
end
