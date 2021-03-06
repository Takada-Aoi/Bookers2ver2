class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
   unless @user == current_user
    redirect_to user_path(current_user.id)
   end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end 
  
  def destroy
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end  
  
end
