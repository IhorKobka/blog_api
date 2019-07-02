# frozen_string_literal: true

class PostBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :body, :created_at, :updated_at
  association :category, blueprint: CategoryBlueprint
end
