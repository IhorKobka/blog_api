# frozen_string_literal: true

module Api
  class CategoriesController < ApplicationController
    private

    def collection
      @collection ||= Categories.all.order(:name)
    end

    def serializer
      @serializer ||= CategorySerializer
    end
  end
end
