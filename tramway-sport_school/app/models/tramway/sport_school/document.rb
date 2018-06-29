module Tramway::SportSchool
  class Document < ::Tramway::Core::ApplicationRecord
    mount_uploader :file, FileUploader

    enumerize :document_type, in: [ :education, :school_info, :provision, :headers, :finance, :materially ], default: :education

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

    scope :published, -> { active.where view_state: :published }
    scope :hidden, -> { active.where view_state: :hidden }

    scope :education, -> { where document_type: :education }
    scope :school_info, -> { where document_type: :school_info }
    scope :provision, -> { where document_type: :provision }
    scope :headers, -> { where document_type: :headers }
    scope :finance, -> { where document_type: :finance }
    scope :materially, -> { where document_type: :materially }
  end
end
