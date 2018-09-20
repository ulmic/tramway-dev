class Tramway::Page::PageForm < ::Tramway::Core::ApplicationForm
  properties :title, :body, :slug

  def initialize(object)
    form_object = super object
    form_properties title: :string,
                    body: :ckeditor,
                    slug: :string
    form_object
  end
end
