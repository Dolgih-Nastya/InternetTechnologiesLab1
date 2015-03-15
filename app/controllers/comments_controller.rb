class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create
    @comment.body = comment_params[:body]
    @comment.user = User.find_by(id:comment_params[:user_id])
    puts "comment_params"
    puts comment_params
    puts "user"
    puts @comment.user.email
    #@comment.user = current_user
    @comment.save!
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def upvote
    @comment = Comment.find(params[:comment_id])
    @comment.liked_by current_user
    redirect_to article_path(params[:article_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
