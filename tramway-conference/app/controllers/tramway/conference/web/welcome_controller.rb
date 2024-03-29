# frozen_string_literal: true

class Tramway::Conference::Web::WelcomeController < Tramway::Conference::ApplicationController
  def index
    return unless ::Tramway::Conference::Unity.any?

    @unity = ::Tramway::Conference::Unity.includes(:social_networks).first
    @blocks = ::Tramway::Landing::BlockDecorator.decorate ::Tramway::Landing::Block.on_main_page
    @news = ::Tramway::News::News.first(3).map { |t| ::Tramway::Landing::Cards::NewsDecorator.new t }
    past_events = ::Tramway::Event::EventLinkDecorator.decorate ::Tramway::Event::Event.past.open.order begin_date: :desc
    past_events_links = Tramway::Landing::NavbarDecorator.new [{ past_events: past_events }]
    actual_events = ::Tramway::Event::EventLinkDecorator.decorate ::Tramway::Event::Event.actual.open.order :begin_date
    @links = actual_events + past_events_links
    @close_events = ::Tramway::Event::Event.actual.open.map do |event|
      ::Tramway::Event::EventAsPageWithButtonDecorator.decorate event
    end
    @partners = ::Tramway::Partner::Partnership.partnership_type.values.reduce({}) do |hash, partnership_type|
      hash.merge! partnership_type => (@unity.send(partnership_type.to_s.pluralize).map do |partner|
        Tramway::Partner::OrganizationFeatureDecorator.decorate partner
      end)
    end
  end
end
