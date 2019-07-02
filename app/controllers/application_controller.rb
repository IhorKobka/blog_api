# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JsonResponseable

  def index
    json_collection_response(collection, blueprint, pagination: false)
  end

  def show
    json_response(resource, blueprint)
  end

  def create
    build_resource
    resource.save!
    json_response(resource, blueprint, status: :created)
  end

  def update
    resource.update!(resource_params)
    json_response(resource, blueprint)
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

  def blueprint
    raise NotImplementedError
  end
end
