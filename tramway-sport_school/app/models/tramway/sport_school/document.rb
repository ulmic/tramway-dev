module Tramway::SportSchool
  class Document < ::Tramway::Core::ApplicationRecord
    mount_uploader :file, FileUploader

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
  end
end
