class Article < ApplicationRecord
    belongs_to :category
    has_many :comments

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  