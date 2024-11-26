class PagesController < ApplicationController
  def index
  end

  def contact
  end

  def about
  end

  def show
    @page = Page.find(params[:id])  # Example for dynamic page lookup
  end
end
