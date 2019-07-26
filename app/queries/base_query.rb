# frozen_string_literal: true

class BaseQuery
  attr_reader :scope, :params

  def initialize(scope, params)
    @scope = scope
    @params = params
  end

  def call
    params&.keys&.each { |filter| public_send("by_#{filter}") if respond_to?("by_#{filter}") }
    scope
  end

  def self.call(*args, &block)
    new(*args, &block).call
  end
end