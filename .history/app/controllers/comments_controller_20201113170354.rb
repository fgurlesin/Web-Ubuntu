class CommentsController < ApplicationController



  def create 
    @article=Article.find(params[:article_id])
    @comment=@article.comments.create(params[:comment].permit(:name,:comment))
    redirect_to article_path(@article)
  end

  def destroy 
    @article=Article.find(params[:article_id])
    @comment=@article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  def require_admin 
    if !(logged_in? && current_user==@user)
      flash[:alert]="You have no permit for this action"
      redirect_to  categories_path
    end

end
