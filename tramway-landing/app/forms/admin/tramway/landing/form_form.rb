# frozen_string_literal: true

class Admin::Tramway::Landing::FormForm < Tramway::Core::ApplicationForm
  association :block

  properties :title, :url, :form_name, :position

  def initialize(object)
    super(object).tap do
      form_properties block: :association,
                      title: :string,
                      url: :string,
                      form_name: :default,
                      position: :integer
    end
  end
end
