class Tramway::Event::EventsController < Tramway::Event::ApplicationController
  layout 'tramway/landing/application'

  def show
    event = ::Tramway::Event::Event.find params[:id]
    @event = ::Tramway::Event::Events::Show::EventDecorator.decorate event
    @participant_form = ::Tramway::Event::ParticipantExtendedFormCreator.create_form_class(request.uuid, @event).new ::Tramway::Event::Participant.new
    @sections_as_features = @event.sections.active.order(position: :asc).map { |s| ::Tramway::Event::SectionFeatureDecorator.decorate s }
    @sections = @event.sections.active.order(position: :asc).map { |s| ::Tramway::Event::SectionDecorator.decorate s }
    @footer = ::Tramway::Landing::BlockDecorator.decorate ::Tramway::Landing::Block.footer
    @events = ::Tramway::Event::Event.active.actual.map { |e| ::Tramway::Event::Events::Show::EventDecorator.decorate e }
    @people_as_features = @event.partakings.active.map { |p| ::Tramway::Event::PartakingFeatureDecorator.decorate p }
    @partners = ::Tramway::Partner::Partnership.partnership_type.values.reduce({}) do |hash, partnership_type|
      hash.merge! partnership_type => (event.send(partnership_type.to_s.pluralize).active.map do |partner|
        Tramway::Partner::OrganizationFeatureDecorator.decorate partner
      end)
    end
  end
end
