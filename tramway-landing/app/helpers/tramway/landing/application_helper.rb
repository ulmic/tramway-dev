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
    end
  end
end
