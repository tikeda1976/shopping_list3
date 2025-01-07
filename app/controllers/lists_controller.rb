class ListsController < ApplicationController
  # 一覧表示アクション
  def index
    @lists = List.all
  end

  # 新規作成フォームアクション
  def new
    @list = List.new
  end

  # 新規作成アクション
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'リストが作成されました。'
    else
      render :new
    end
  end

  private

  # strong parameters: ユーザーからの入力を許可する
  def list_params
    params.require(:list).permit(:name, :description) # 必要に応じてカラムを変更
  end
end
