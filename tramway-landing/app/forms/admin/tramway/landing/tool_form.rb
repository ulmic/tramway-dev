class Admin::Tramway::Landing::ToolForm < Tramway::Core::ApplicationForm
  properties :title, :account_id

  def initialize(object)
    super(object).tap do
      form_properties title: :default,
        account_id: :string
    end
  end
end
