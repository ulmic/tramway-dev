# frozen_string_literal: true

class ::Tramway::Page::PreviewsController < ::Tramway::Page::ApplicationController
  include Tramway::AuthManagement
  layout 'tramway/landing/application'

  before_action :authenticate_admin!

  def show
    @page = ::Tramway::Page::Page.find params[:id]
    @blocks = @page.blocks.map do |block|
      if block.block_type.header_with_form? && block.form_url.present?
        # FIXME: in future
        @header_with_form = block.form_to_render.new(Tramway::Auth.authenticable_models.first.new, page: @page.id)
      end
      ::Tramway::Landing::BlockDecorator.decorate block
    end
  end
end
