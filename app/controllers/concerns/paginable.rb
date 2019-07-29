# frozen_string_literal: true

module Paginable
  include Pagy::Backend

  def current_page
    (params[:page] || 1).to_i
  end

  def per_page
    params.fetch(:per_page) { 25 }
  end

  def collection
    @collection = method(:collection).super_method.call
    @pagy, @collection = pagy(@collection, items: per_page, page: current_page)
    @collection
  end
end
