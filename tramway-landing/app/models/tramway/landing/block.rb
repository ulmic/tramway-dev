# frozen_string_literal: true

class Tramway::Landing::Block < ::Tramway::Landing::ApplicationRecord
  belongs_to :page, class_name: 'Tramway::Page::Page'
  has_many :forms, -> { order(position: :asc) }, class_name: 'Tramway::Landing::Form'

  enumerize :block_type, in: %i[header header_with_form footer page cards features contacts link page_with_button just_text view]
  enumerize :navbar_link, in: %i[exist not_exist], default: :not_exist
  enumerize :link_object_type, in: ['Tramway::SportSchool::Document', 'Tramway::Page::Page']

  uploader :background, :photo, extensions: %i[jpg jpeg gif png]

  aasm column: :view_state do
    state :published, initial: true
    state :hidden

    event :publish do
      transitions from: :hidden, to: :published
    end

    event :hide do
      transitions from: :published, to: :hidden
    end
  end

  store_accessor :button, :button_link
  store_accessor :button, :button_title

  scope :on_main_page, lambda {
    joins(:page).where(view_state: :published).where('tramway_page_pages.page_type = ?', :main).order :position
  }
  scope :with_navbar_link, -> { where navbar_link: :exist }
  scope :header, -> { on_main_page.where(block_type: :header).first }
  scope :footer, -> { on_main_page.where(block_type: :footer).first }
  scope :published, -> { where(view_state: :published) }

  def link_object
    link_object_type.constantize.find link_object_id
  end

  def header?
    block_type.in? %w[header header_with_form]
  end

  def footer?
    block_type.footer?
  end

  def form_to_render
    case values['form_url']
    when '/auth/sign_up'
      "#{Tramway::Auth.authenticable_models.first}SignUpForm".constantize
    end
  end
end
