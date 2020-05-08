# frozen_string_literal: true

module Tramway
  module Landing
    module ApplicationHelper
      include Tramway::Admin::RussianCasesHelper
      include Tramway::Profiles::LinksHelper if defined?(::Tramway::Profiles)

      def actual_forms(forms)
        forms = forms.select { |f| f.form_name != 'user_sign_up' } if @signed_in
        forms = forms.select { |f| f.form_name != 'user_sign_in' } if @signed_in
        forms
      end
      
      def block_title(collection_block)
        collection_block.each do |block|
          if block.page.page_type.main?
            (content_for?(:application_name) && yield(:application_name).present?) ? yield(:application_name) : @application.public_name
          else
            block.page.title
          end
        end
      end

      def block_tagline(collection_block)
        collection_block.each do |block|
          if block.page.page_type.main?
            (content_for?(:application_tagline) && yield(:application_tagline).present?) ? yield(:application_tagline) : @application.tagline
          else
            raw block.page.body
          end
        end
      end
    end
  end
end
