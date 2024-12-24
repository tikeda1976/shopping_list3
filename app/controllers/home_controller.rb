class HomeController < ApplicationController
  def index
    @items = Item.all  # アイテムのリストを取得
    @item = Item.new   # 新規作成フォームのための空のインスタンス
  end
end
