class Admin::Tramway::Landing::FormForm < Tramway::Core::ApplicationForm
  properties :title, :form_name

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
        form_name: :default
    end
  end
end
