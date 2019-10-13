# frozen_string_literal: true

class ::Tramway::Page::PagesController < ::Tramway::Page::ApplicationController
  layout 'tramway/landing/application'

  def show
    @page = ::Tramway::Page::Page.find_by slug: params[:slug]
  end
end
