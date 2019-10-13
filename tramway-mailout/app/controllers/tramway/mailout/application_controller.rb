# frozen_string_literal: true

module Tramway
  module Mailout
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
