class PostsController < ApplicationController
 before_action :require_user_logged_in, except: [:show]
 before_action :correct_user, only: [:destroy]  
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
  @post= Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'レシピを投稿しました。'
      redirect_to @post
    else
      flash.now[:danger] = 'レシピの投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'レシピを更新しました。'
      redirect_to @post
    else
      flash.now[:danger] = 'レシピの投稿に失敗しました。'
      render :new
    end    
  end  

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'レシピを削除しました。'
    redirect_to root_url    
  end
  
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
  end

  private

  def post_params
    params.require(:post).permit(:title, :ingredient,:content, :image, :remove_img)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
