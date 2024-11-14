class Article < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, :content, :author, :category, presence: true
end