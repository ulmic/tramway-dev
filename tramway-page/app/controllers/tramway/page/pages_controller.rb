# frozen_string_literal: true

class ::Tramway::Page::PagesController < ::Tramway::Page::ApplicationController
  layout 'tramway/landing/application'

  def show
    @application = ::Tramway::Core.application_object # FIXME: need to be in the Tramway::Core::ApplicationController
    @page = ::Tramway::Page::Page.published.find_by slug: params[:slug]
    @blocks = @page.blocks.published.active.map do |block|
      if block.block_type.header_with_form? && block.form_url.present?
        # FIXME: in future
        @header_with_form = block.form_to_render.new(Tramway::Auth.authenticable_models.first.new, page: @page.id)
      end
      if block.block_type.in? %i[header header_with_form]
        @links = Tramway::Landing::BlockLinkDecorator.decorate @page.with_navbar_link.active
      end
      ::Tramway::Landing::BlockDecorator.decorate block
    end
  end
end
