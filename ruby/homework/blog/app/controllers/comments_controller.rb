class CommentsController < ApplicationController
    http_basic_authenticate_with name: "miia", password: "pass", only: :destroy

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to article_path(@comment.article), notice: 'Comment was successfully deleted.'
      end

    private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

end
