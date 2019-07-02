# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category, counter_cache: true

  has_many :posts_tags
  has_many :tags, through: :posts_tags

  validates :title, :body, presence: true
end
