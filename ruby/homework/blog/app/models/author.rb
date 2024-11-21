class Author < ApplicationRecord
    has_many :articles, dependent: :destroy

    validates :name, presence: true
    validates :bio, presence: true, length: {minimum: 10}
end
