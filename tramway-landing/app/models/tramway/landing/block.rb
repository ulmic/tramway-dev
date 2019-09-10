class Tramway::Landing::Block < ::Tramway::Landing::ApplicationRecord
  enumerize :block_type, in: [
    :header,
    :footer,
    :page,
    :cards,
    :features,
    :contacts,
    :news,
    :link,
    :page_with_button,
    :just_text,
    :view
  ]
  enumerize :navbar_link, in: [ :exist, :not_exist ], default: :not_exist
  enumerize :link_object_type, in: [ 'Tramway::SportSchool::Document', 'Tramway::Page::Page' ]

  mount_uploader :background, PhotoUploader

  state_machine :view_state, initial: :published do
    state :published
    state :hidden

    event :publish do
      transition hidden: :published
    end

    event :hide do
      transition published: :hidden
    end
  end

  scope :on_main_page, -> { active.where(view_state: :published).order :position }
  scope :with_navbar_link, -> { where navbar_link: :exist }
  scope :header, -> { on_main_page.where(block_type: :header).first }
  scope :footer, -> { on_main_page.where(block_type: :footer).first }

  def link_object
    link_object_type.constantize.find link_object_id
  end
end
