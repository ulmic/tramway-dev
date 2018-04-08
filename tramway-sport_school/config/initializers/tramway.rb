::Tramway::User.root_path = '/admin'
::Tramway::Admin.set_available_models ::Tramway::SportSchool::KindSport,
                                      ::Tramway::SportSchool::Trainer,
                                      ::Tramway::SportSchool::Document,
                                      ::Tramway::SportSchool::Organization
::Tramway::Admin.set_singleton_models ::Tramway::SportSchool::Institution
::Tramway::Core.initialize_application model_class: ::Tramway::SportSchool::Institution
::Tramway::Profiles.records = [ ::Tramway::SportSchool::Institution ]
::Tramway::Admin.set_additional_buttons Tramway::SportSchool::Institution.to_s => {
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
}
