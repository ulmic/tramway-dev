require_dependency "tramway/sport_school/application_controller"

class Tramway::SportSchool::Web::WelcomeController < ::Tramway::SportSchool::ApplicationController
  def index
    @kind_sports = ::Tramway::SportSchool::KindSport.active.published.map { |k| ::Tramway::SportSchool::Features::KindSportDecorator.new k }
    @documents = ::Tramway::SportSchool::Document.active.published
    @trainers = ::Tramway::SportSchool::Trainer.active.published.map { |t| ::Tramway::SportSchool::Cards::TrainerDecorator.new t }
    @institution = ::Tramway::SportSchool::Institution.includes(:social_networks).first
    @blocks = ::Tramway::Landing::Block.on_main_page
    @organizations = ::Tramway::SportSchool::Organization.published
    @news = ::Tramway::News::News.active.last(3).reverse.map { |t| ::Tramway::Landing::Cards::NewsDecorator.new t }
    @education_documents = ::Tramway::SportSchool::Document.published.education.map { |t| ::Tramway::SportSchool::Cards::DocumentDecorator.new t }
    @school_info_documents = ::Tramway::SportSchool::Document.published.school_info.map { |t| ::Tramway::SportSchool::Cards::DocumentDecorator.new t }
    @provision_documents = ::Tramway::SportSchool::Document.published.provision.map { |t| ::Tramway::SportSchool::Cards::DocumentDecorator.new t }
    @headers_documents = ::Tramway::SportSchool::Document.published.headers.map { |t| ::Tramway::SportSchool::Cards::DocumentDecorator.new t }
    @finance_documents = ::Tramway::SportSchool::Document.published.finance.map { |t| ::Tramway::SportSchool::Cards::DocumentDecorator.new t }
  end
end
