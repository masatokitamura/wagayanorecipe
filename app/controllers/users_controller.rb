class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :destroy]

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(9)
    counts(@user)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy 
    @user = current_user
    @user.destroy
    flash[:success] = '退会しました'
    redirect_to root_url
  end
  
    
  def likes
    @user = User.find(params[:id])
    @favposts = @user.favpost.order(id: :desc).page(params[:page]).per(9)
    counts(@user)

  end  
end  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
