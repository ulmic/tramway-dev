module Tramway
  module Core
    module TitleHelper
      def title(page_title = default_title)
        title_text = "#{page_title} | #{@application.title}"
        content_for(:title) { title_text }
      end

      def default_title
        t('.title')
      end

      def page_title(action, model_name)
        t("helpers.actions.#{action}") + ' ' + genitive(model_name)
      end
    end
  end
end
