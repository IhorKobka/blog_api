# frozen_string_literal: true

module JsonResponseable
  # options - view, root, meta
  def json_response(object, blueprinter, options = {})
    render json: blueprinter.render(object, options), status: options[:status] || :ok
  end

  def json_collection_response(collection, blueprinter, options = {})
    meta = options[:meta]
    meta.merge!(pagination_data(collection)) if options[:pagination]

    json_response(collection, blueprinter, root: :collection, view: options[:view],
                                           meta: meta, status: options[:status])
  end

  def json_error_response(message, status)
    render json: { error: message }, status: status
  end

  private

  def pagination_data(collection)
    {
      total_count: collection.total_count,
      total_pages: collection.total_pages,
      current_page: collection.current_page,
      per_page: collection.current_per_page
    }
  end
end
