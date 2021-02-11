class Tramway::Landing::Tool < Tramway::Core::ApplicationRecord
  enumerize :title, in: [ :google_tag_manager, :google_analytics, :yandex_direct ]

  def with_body_fragment?
    title.google_tag_manager?
  end
end
