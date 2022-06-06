class CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @comment = current_user.comments.new(comment_params)
    @comment.book_id = book.id
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
