class Tramway::Event::EventsController < Tramway::Event::ApplicationController
  layout 'tramway/landing/application'

  def show
    @event = ::Tramway::Event::EventDecorator.decorate ::Tramway::Event::Event.find params[:id]
    @participant_form = ::Tramway::Event::ParticipantExtendedFormCreator.create_form_class(request.uuid, @event).new ::Tramway::Event::Participant.new
    @sections_as_features = @event.sections.order(position: :asc).map { |s| ::Tramway::Event::SectionFeatureDecorator.decorate s }
    @sections = @event.sections.order(position: :asc).map { |s| ::Tramway::Event::SectionDecorator.decorate s }
    @footer = ::Tramway::Landing::BlockDecorator.decorate ::Tramway::Landing::Block.footer
    @events = ::Tramway::Event::Event.active.map { |e| ::Tramway::Event::EventDecorator.decorate e }
  end
end
