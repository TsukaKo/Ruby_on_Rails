class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #旧 #1.データを新規登録するためのインスタンス作成
    # 旧list = List.new (list_params)
    #旧 #2.データをデータベースに保存するためのsaveメソッド実行
    #旧 list.save
    #旧 #3.詳細画面へリダイレクト
    #旧redirect_to todolist_path(list.id)
     # 更新。返されたバリデーションの結果をコントローラで検証できるように
    @list =List.new(list_params)
    if @list.save
      redirect_to todolist_path(@list.id)
    else
      render :new
    end
  end

  # 一覧表示であり複数あるため（lists)、全て取得する（all)
  def index
    @lists = List.all
  end

  # 詳細画面
  def show
    @list = List.find (params[:id])
  end

  # データ編集画面
  def edit
    @list = List.find(params[:id])
  end

  # 編集できるようにする
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list =List.find(params[:id])
    list.destroy  #データ（レコード）を削除
    redirect_to todolists_path
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end

end
