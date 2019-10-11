class ToppagesController < ApplicationController
  def index
    @posts = Post.order(id: :desc).page(params[:page]).search(params[:search]).per(9)
  end
  
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Project.all #全て表示。
    end
  end
end  
