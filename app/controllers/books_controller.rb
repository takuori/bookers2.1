class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]


  def index
    @books = Book.all
    @books = Book.all.order(params[:sort])
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "投稿成功しました"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "更新完了しました"
      redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def search_book
    @books = Book.search(params[:keyword])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :rate, :category)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
