class Tramway::Site::Web::WelcomeController < Tramway::Site::Web::ApplicationController
  def index
    @blocks = ::Tramway::Landing::BlockDecorator.decorate ::Tramway::Landing::Block.on_main_page
  end
end
