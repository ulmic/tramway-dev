# frozen_string_literal: true

module Tramway
  module Landing
    module ApplicationHelper
      include Tramway::Admin::RussianCasesHelper
      include Tramway::Profiles::LinksHelper if defined?(::Tramway::Profiles)

      def actual_forms(forms)
        forms = forms.reject { |f| f.form_name == 'user_sign_up' } if @signed_in
        forms = forms.reject { |f| f.form_name == 'user_sign_in' } if @signed_in
        forms
      end

      def block_title(block)
        unless block.is_a? Array
          if block.page.page_type.main?
            content_for?(:application_name) && content_for(:application_name).present? ? content_for(:application_name) : @application.public_name
          end
        else
          block.each do |current_block|
            current_block.page.title
          end
        end
      end

      def block_tagline(block)
        unless block.is_a? Array
          if block.page.page_type.main?
            content_for?(:application_tagline) && content_for(:application_tagline).present? ? content_for(:application_tagline) : @application.tagline
          else
            block.each do |current_block|
              raw block.page.body
            end
          end
        end
      end
    end
  end
end
