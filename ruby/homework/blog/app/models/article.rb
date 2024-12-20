class Article < ApplicationRecord
    belongs_to :category
    belongs_to :author

    has_many :comments, dependent: :destroy

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10}
    validates :author, presence: true
end
