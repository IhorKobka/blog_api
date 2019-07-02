# frozen_string_literal: true

class PostBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :body, :created_at, :updated_at

  association :category, blueprint: CategoryBlueprint

  view :show do
    association :tags, blueprint: TagBlueprint
  end
end
