# frozen_string_literal: true

class Tramway::Page::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
