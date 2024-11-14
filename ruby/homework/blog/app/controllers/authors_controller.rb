class AuthorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if author.save
      redirect_to author_path(author), notice: 'Author created successfully.'
    else
      render :new
    end
  end

  def show
    # @author is set in the set_author method
    @articles = @author.articles # Assumes an association where Author has_many :articles
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to author_path(author), notice: 'Author updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    author.destroy
    redirect_to authors_path, notice: 'Author was successfully deleted.'
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :bio)
  end
end