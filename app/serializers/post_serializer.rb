# frozen_string_literal: true

class PostSerializer < Panko::Serializer
  attributes :id, :body, :title, :created_at, :updated_at

  has_one :category, serializer: ::CategorySerializer
  has_many :tags, serializer: ::TagSerializer
end