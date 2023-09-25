class PrototypesesController < ApplicationController
# <before_actionの二行はピックツイートのコピペ。使えそうなら使います。>
# <未ログイン者の新規投稿URLアクセス　→　リダイレクトのアクションはprivateで定義>
  
  # before_action :set_tweet, only: [:edit, :show] 

# <未ログインユーザー indexとshow以外は閲覧制限される>
  before_action :move_to_index, except: [:index, :show]

  def index
    # @prototypeses = Prototype.all ←まだプロトタイプテーブル作っていないのでコメントアウト
  end

  def new
    @prototype = Prototype.new
  end

  def create
    prototype.create(prototype_params) #{ストロングﾊﾟﾗﾒｰﾀｰ作成メソッドの名前が引数}
  end

  def destroy

  end

  def edit
    
  end

  def update
    
  end

  def show
    # @user = User.find(params[:id]) ←一回非表示
  end

  private
  # ＜ピックツイートのコントローラー記述をコピペしました、適宜変更していきましょう＞
  # def tweet_params
  #   params.require(:tweet).permit( :image, :text).merge(user_id: current_user.id)
  # end

  # def set_tweet
  #   @tweet = Tweet.find(params[:id])
  # end

  def prototype_params
    params.require(:prototype).permit(:name, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
