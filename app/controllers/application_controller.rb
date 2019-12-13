# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  skip_before_action :verify_authenticity_token, raise: false
end
