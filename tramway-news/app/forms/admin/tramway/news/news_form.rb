# frozen_string_literal: true

class Admin::Tramway::News::NewsForm < ::Tramway::ApplicationForm
  properties :title, :body, :published_at, :photo

  def initialize(object)
    form_object = super object
    form_properties title: :string,
                    body: :ckeditor,
                    photo: :file
    form_object
  end
end
