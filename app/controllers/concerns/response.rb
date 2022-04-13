# frozen_string_literal: true

module Response
  extend ActiveSupport::Concern

  included do
    def json_response(object, status = :ok)
      render json: object, status:
    end
  end
end
