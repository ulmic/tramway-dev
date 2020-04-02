# frozen_string_literal: true

class Tramway::Landing::Block < ::Tramway::Landing::ApplicationRecord
  enumerize :block_type, in: %i[header header_with_form footer page cards features contacts link page_with_button just_text view]
  enumerize :navbar_link, in: %i[exist not_exist], default: :not_exist
  enumerize :link_object_type, in: ['Tramway::SportSchool::Document', 'Tramway::Page::Page']

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

  store_accessor :values, :page
  store_accessor :values, :form_url

  scope :on_main_page, -> do
    active.where(view_state: :published).where("(values -> 'page') IS NOT NULL").order :position 
  end
  scope :with_navbar_link, -> { where navbar_link: :exist }
  scope :header, -> { on_main_page.where(block_type: :header).first }
  scope :footer, -> { on_main_page.where(block_type: :footer).first }

  def link_object
    link_object_type.constantize.find link_object_id
  end

  def header?
    block_type.in? [ 'header', 'header_with_form']
  end

  def footer?
    block_type.footer?
  end
end
