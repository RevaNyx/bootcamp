class AddCategoryToArticles < ActiveRecord::Migration[7.2]
  def change
    add_reference :articles, :category, foreign_key: true
  end
end
