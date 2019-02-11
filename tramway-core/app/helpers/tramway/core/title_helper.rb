module Tramway
  module Core
    module TitleHelper
      def title(page_title = default_title)
        if @application.present?
          title_text = "#{page_title} | #{@application.try(:title) || @application.public_name}" 
          content_for(:title) { title_text }
        else
          error = Tramway::Error.new(plugin: :core, method: :title, message: ('You should set Tramway::Core::Application class using `::Tramway::Core.initialize_application model_class: #{model_class_name}` in config/initializers/tramway.rb'))
          raise error.message
        end
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
