class Admin::Tramway::Landing::Blocks::RemoveFormForm < Tramway::Core::ApplicationForm
  properties :id

  def submit(params)
    model.forms -= [Tramway::Landing::Form.find(params)] if id.present?
    model.save!
  end
end
