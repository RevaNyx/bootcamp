class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:destroy]
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
      resources :articles do
        resources :comments, only: [:create, :destroy]  # Only allow create and destroy actions for comments
      end
      
        @comment.destroy
        redirect_to article_path(@comment.article), notice: 'Comment was successfully deleted.'
      end

    private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end
end
