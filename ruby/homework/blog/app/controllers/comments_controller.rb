class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:destroy]

  def destroy
    @comment.destroy
    redirect_to article_path(@article), notice: 'Comment was successfully deleted.'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end
end
  
