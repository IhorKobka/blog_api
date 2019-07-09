# frozen_string_literal: true

module ErrorsCatcher
  extend ActiveSupport::Concern

  included do
    rescue_from ApiAuthentication::Errors::Auth::InvalidCredentials, with: :unauthorized_request
    rescue_from ApiAuthentication::Errors::Token::Missing, with: :unauthorized_request
    rescue_from ApiAuthentication::Errors::Token::Invalid, with: :unauthorized_request
  end

  private

  def unauthorized_request(error)
    json_error_response(error.message, :unauthorized)
  end
end
