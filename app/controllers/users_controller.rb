class UsersController < ApplicationController
  # アクション実行前にログインされてるかどうか確認(indexは除く)
  before_action :authenticate_user!, except: [:index]
  
  def index
  end

  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def mypage
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
    redirect_to users_profile_path
    else
    render 'users_mypage_path'
    end
  end

  private

  def user_params 
    params.require(:user).permit(:name, :image, :introduction)
  end
end
