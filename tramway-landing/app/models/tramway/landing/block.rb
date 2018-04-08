class Tramway::Landing::Block < ::Tramway::Landing::ApplicationRecord
  enumerize :block_type, in: [ :header, :footer, :page, :cards, :features, :contacts, :news ]
  enumerize :navbar_link, in: [ :exist, :not_exist ], default: :not_exist

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
end
