class CommentsController < ApplicationController



  def create 
    @article=Article.find(params[:article_id])
    @comment=@article.comments.create(params[:comment].permit(:name,:comment))
    redirect_to article_path(@article)
  end

  def destroy 
    @article=Article.find(params[:post_id])
    @comment=@article.comments.find(params[:id])
    redirect_to artcile_path(@article)
  end
 

end
