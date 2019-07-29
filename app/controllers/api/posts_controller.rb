# frozen_string_literal: true

module Api
  class PostsController < ApplicationController
    prepend Paginable

    private

    def collection
      @collection ||= PostsCollectionQuery.call(Post.includes(:category), resource_params)
    end

    def resource
      @resource ||= Post.includes(:tags).find(params[:id])
    end

    def serializer
      @serializer ||= PostSerializer
    end

    def index_options
      {
        pagination: @pagy,
        serializer_options: {
          except: { instance: [:tags], category: [:posts_count] },
          context: { short_body: true }
        }
      }
    end

    def resource_params
      params.permit(:q, :category_id, :type)
    end
  end
end
