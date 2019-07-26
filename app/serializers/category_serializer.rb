# frozen_string_literal: true

class CategorySerializer < Panko::Serializer
  attributes :id, :name, :posts_count
end
