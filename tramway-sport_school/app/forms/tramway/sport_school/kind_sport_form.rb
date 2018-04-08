class Tramway::SportSchool::KindSportForm < ::Tramway::Core::ApplicationForm
  properties :title, :view_state, :image, :description

  def initialize(object)
    form_object = super object
    form_properties title: :string, image: :file, description: :default
    form_object
  end
end
