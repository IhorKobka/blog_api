# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category, counter_cache: true

  validates :title, :body, presence: true
end
