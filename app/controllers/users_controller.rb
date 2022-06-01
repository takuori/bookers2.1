class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
