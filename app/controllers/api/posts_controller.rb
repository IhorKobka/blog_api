# frozen_string_literal: true

module Api
  class PostsController < ApplicationController
    private

    def collection
      @collection ||= Post.includes(:category).all
    end

    def resource
      @resource ||= Post.find(params[:id])
    end

    def blueprint
      @blueprint ||= PostBlueprint
    end
  end
end
