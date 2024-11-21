class AssignDefaultAuthorToArticles < ActiveRecord::Migration[7.2]
  def up
    # Create a default author if none exists
    default_author = Author.find_or_create_by!(name: "Default Author", bio: "This is a placeholder author.")

    # Assign the default author to articles without an author
    Article.where(author_id: nil).update_all(author_id: default_author.id)
  end

  def down
    # Revert the changes by setting the author_id to nil for the articles that were updated
    default_author = Author.find_by(name: "Default Author")
    if default_author
      Article.where(author_id: default_author.id).update_all(author_id: nil)
      default_author.destroy
    end
  end
end
