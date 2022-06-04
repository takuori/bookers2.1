class FavoritesController < ApplicationController

  def create
   @book = Book.find(params[:id])
   favorite = current_user.favorites.new(book_id: @book.id)
   favorite.save
   redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    favorite = current_user.favorties.find_by(book_id: @book.id)
    favorite.destroy
    redirect_to books_path
  end
end
