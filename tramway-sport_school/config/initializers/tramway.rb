# frozen_string_literal: true

::Tramway::Auth.root_path_for Tramway::User::User => '/admin'
::Tramway.set_available_models(::Tramway::SportSchool::KindSport,
  ::Tramway::SportSchool::Trainer,
  ::Tramway::SportSchool::Document,
  ::Tramway::SportSchool::Organization,
  ::Tramway::User::User,
  ::Tramway::Page::Page,
  project: :sport_school)
::Tramway.set_singleton_models(::Tramway::SportSchool::Institution, project: :sport_school)
::Tramway.initialize_application model_class: ::Tramway::SportSchool::Institution
::Tramway.set_additional_buttons({ Tramway::SportSchool::Institution.to_s => {
                                          show: ::Tramway::Profiles::SocialNetwork.network_name.values.map do |network|
                                            {
                                              action: :new,
                                              model_name: Tramway::Profiles::SocialNetwork.to_s,
                                              text: "Добавить профиль #{network}",
                                              params: {
                                                Tramway::Profiles::SocialNetwork.to_s.underscore => {
                                                  record_type: -> { model_name.name },
                                                  record_id: -> { id },
                                                  network_name: network
                                                }
                                              }
                                            }
                                          end
                                        } }, project: :sport_school)

::Tramway::Landing.head_content = lambda do
  concat stylesheet_link_tag    'tramway/sport_school/application', media: 'all'
  concat javascript_include_tag 'tramway/sport_school/application'
end
