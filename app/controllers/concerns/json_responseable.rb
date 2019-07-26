# frozen_string_literal: true

module JsonResponseable
  def json_response(object, serializer, options = {})
    render json: serializer.new(options[:serializer_options] || {}).serialize_to_json(object)
  end

  def json_collection_response(collection, serializer, options = {})
    response = {
      collection: Panko::ArraySerializer.new(
        collection,
        array_serializer_options(serializer, options[:serializer_options]),
      )
    }
    response[:meta] = pagination_data(collection) if options[:pagination]

    render json: Panko::Response.new(response)
  end

  def json_error_response(message, status)
    render json: { error: message }, status: status
  end

  private

  def array_serializer_options(serializer, serializer_options = {})
    options = serializer_options || {}
    options[:each_serializer] = serializer
    options
  end

  def pagination_data(collection)
    {
      total_count: collection.total_count,
      total_pages: collection.total_pages,
      current_page: collection.current_page,
      per_page: collection.current_per_page
    }
  end
end
