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
  end
end
