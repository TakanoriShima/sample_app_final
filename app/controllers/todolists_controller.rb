class TodolistsController < ApplicationController
  def index
    @lists = List.all
  end
  def show
    @list = List.find(params[:id])
  end
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to todolist_path(@list.id)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update

    # ---- ここからコードを書きましょう ---- #
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
    # ---- ここまでのあいだにコードを書きましょう ---- #

  end
  
  def destroy
    # ---- ここからコードを書きましょう ---- #
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to todolists_path, status: :see_other  # 投稿一覧画面へリダイレクト
    # ---- ここまでのあいだにコードを書きましょう ---
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  # ---- ここまでのあいだにコードを書きましょう ---- 
end
