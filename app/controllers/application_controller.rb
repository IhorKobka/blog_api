# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApiAuthentication::RequestAuthorizeable
  include JsonResponseable
  include ErrorsCatcher

  # before_action :authenticate!

  def index
    json_collection_response(collection, serializer, index_options)
  end

  def show
    json_response(resource, serializer, show_options)
  end

  def create
    build_resource
    resource.save!
    json_response(resource, serializer, create_options)
  end

  def update
    resource.update!(resource_params)
    json_response(resource, serializer, update_options)
  end

  def destroy
    resource.destroy!

    head :no_content
  end

  protected

  def resource
    @resource || (raise NotImplementedError)
  end

  def resource_params
    raise NotImplementedError
  end

  def build_resource
    raise NotImplementedError
  end

  def collection
    raise NotImplementedError
  end

  def serializer
    raise NotImplementedError
  end

  def index_options
    { pagination: false }
  end

  def create_options
    { status: :created }
  end

  def update_options
    {}
  end

  def show_options
    { view: :show }
  end
end
