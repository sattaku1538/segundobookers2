class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end 
  
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
    @users = current_user.id
  end
  
  def edit
   @user = User.find(params[:id])
    # 他ユーザーが使えないようにするコマンド
    unless @user = current_user
    render :edit
    end
  end
  
  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
   private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
