class Tramway::Page::PageForm < ::Tramway::Core::ApplicationForm
  properties :title, :body, :slug, :view

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
        body: :ckeditor,
        slug: :string,
        view: :string
    end
  end
end
