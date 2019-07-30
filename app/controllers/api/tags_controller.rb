# frozen_string_literal: true

module Api
  class TagsController < ApplicationController
    private

    def collection
      @collection ||= Tag.all.order(:name)
    end

    def serializer
      @serializer ||= TagSerializer
    end
  end
end
