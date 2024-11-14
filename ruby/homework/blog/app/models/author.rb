class Author < ApplicationRecord
    has_many :articles, dependent: :destroy
  
    validates :name, :bio, presence: true
  end