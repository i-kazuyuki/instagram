class PicturesController < ApplicationController

  # ログインの有無をチェックするメソッド
  before_action :authenticate_user!

  # before_actionでアクションのメソッドが実行される前に、指定したメソッドを実行することができる。
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pictures_params)
    if @picture.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to pictures_path, notice: "投稿しました"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def edit
  end

  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to pictures_path, notice: "削除しました"
    @picture.destroy
  end


  private
    def pictures_params
      params.require(:picture).permit(:content)
    end

    # idをキーとして値を取得するメソッド
    def set_picture
      @picture = Picture.find(params[:id])
    end
end
