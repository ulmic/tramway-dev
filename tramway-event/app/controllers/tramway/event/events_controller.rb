class Tramway::Event::EventsController < Tramway::Event::ApplicationController
  layout 'tramway/landing/application'

  def show
    @event = ::Tramway::Event::EventDecorator.decorate ::Tramway::Event::Event.find params[:id]
  end
end
