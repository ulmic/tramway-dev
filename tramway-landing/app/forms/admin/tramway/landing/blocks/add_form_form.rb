class Admin::Tramway::Landing::Blocks::AddFormForm < Tramway::Core::ApplicationForm
  class << self
    def associated_as_is(name)
      @@associated_as = name
    end

    def associated_as
      @@associated_as
    end
  end

  properties :form_ids
  association :forms
  associated_as_is :block

  def initialize(object)
    super(object).tap do
      form_properties forms: :association
    end
  end

  def submit(params)
    params[:form_ids].each do |id|
      model.forms << Tramway::Landing::Form.find(id) if id.present?
    end
    model.save!
  end
end
