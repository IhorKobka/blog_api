# frozen_string_literal: true

module Api
  class RecentPostsController < ApplicationController
    private

    def collection
      @collection ||= Post.includes(:category).limit(25)
    end

    def resource
      @resource ||= Post.includes(:tags).find(params[:id])
    end

    def serializer
      @serializer ||= PostSerializer
    end

    protected

    def index_options
      {
        pagination: false,
        serializer_options: {
          except: { instance: [:tags], category: [:posts_count] }
        }
      }
    end
  end
end
