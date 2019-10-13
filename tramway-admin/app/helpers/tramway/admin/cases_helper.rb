# frozen_string_literal: true

module Tramway
  module Admin
    module CasesHelper
      def plural(word)
        if I18n.locale == :ru
          russian_plural word
        else
          word.model_name.human.pluralize(I18n.locale)
        end
      end
    end
  end
end
