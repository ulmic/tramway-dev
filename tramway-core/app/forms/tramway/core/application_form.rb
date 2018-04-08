module Tramway::Core
  class ApplicationForm < ::Reform::Form
    def submit(params)
      raise 'ApplicationForm::Params should not be nil'.inspect unless params
      save if validate params
    end

    def form_properties(**args)
      @form_properties = args
    end

    def properties
      @form_properties
    end
  end
end
