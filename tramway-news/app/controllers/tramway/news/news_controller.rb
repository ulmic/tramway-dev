# frozen_string_literal: true

class ::Tramway::News::NewsController < ::Tramway::News::ApplicationController
  layout 'tramway/landing/application'

  def show
    @news = ::Tramway::News::News.find params[:id]
    @author = ::Tramway::News::UserDecorator.decorate @news.author
  end
end
