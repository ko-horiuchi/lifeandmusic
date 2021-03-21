class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private
  def ensure_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to  user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end