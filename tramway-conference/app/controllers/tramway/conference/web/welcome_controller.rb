require_dependency "tramway/conference/application_controller"

class Tramway::Conference::Web::WelcomeController < ::Tramway::Conference::ApplicationController
  def index
    @unity = ::Tramway::Conference::Unity.includes(:social_networks).first
    @blocks = ::Tramway::Landing::BlockDecorator.decorate ::Tramway::Landing::Block.on_main_page
    @news = ::Tramway::News::News.active.first(3).map { |t| ::Tramway::Landing::Cards::NewsDecorator.new t }
    @links = ::Tramway::Event::EventLinkDecorator.decorate ::Tramway::Event::Event.active
  end
end
