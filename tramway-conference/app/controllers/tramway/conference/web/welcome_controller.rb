require_dependency "tramway/conference/application_controller"

class Tramway::Conference::Web::WelcomeController < ::Tramway::Conference::ApplicationController
  def index
    @unity = ::Tramway::Conference::Unity.includes(:social_networks).first
    @blocks = ::Tramway::Landing::BlockDecorator.decorate ::Tramway::Landing::Block.on_main_page
    @news = ::Tramway::News::News.active.first(3).map { |t| ::Tramway::Landing::Cards::NewsDecorator.new t }
    past_events = ::Tramway::Event::EventLinkDecorator.decorate ::Tramway::Event::Event.active.past.order begin_date: :desc
    past_events_links = Tramway::Landing::NavbarDecorator.new [{ past_events: past_events }]
    actual_events = ::Tramway::Event::EventLinkDecorator.decorate ::Tramway::Event::Event.active.actual.order :begin_date
    @links = actual_events + past_events_links
    main_event = ::Tramway::Event::Event.main_event&.last
    if main_event.present?
      @main_event = ::Tramway::Event::Events::Show::EventDecorator.decorate main_event
      @sections_as_features = main_event.sections.active.order(position: :asc).map { |s| ::Tramway::Event::SectionFeatureDecorator.decorate s }
      @sections = main_event.sections.active.order(position: :asc).map { |s| ::Tramway::Event::SectionDecorator.decorate s }
      @participant_form = ::Tramway::Event::ParticipantExtendedFormCreator.create_form_class(request.uuid, main_event).new ::Tramway::Event::Participant.new
      @people_as_features = @main_event.partakings.active.map { |p| ::Tramway::Event::PartakingFeatureDecorator.decorate p }
    end
  end
end
