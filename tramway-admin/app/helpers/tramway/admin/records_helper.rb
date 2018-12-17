module Tramway::Admin
  module RecordsHelper
    # FIXME replace to module
    def current_model_record_path(*args, **options)
      record_path args, options.merge(model: params[:model])
    end

    def edit_current_model_record_path(*args, **options)
      edit_record_path args, options.merge(model: params[:model])
    end

    def new_current_model_record_path(*args, **options)
      new_record_path args, options.merge(model: params[:model])
    end

    def current_model_records_path(*args, **options)
      records_path args, options.merge(model: params[:model])
    end

    def model_class
      params[:model].constantize
    end

    def decorator_class(model_name = nil)
      "#{model_name || model_class}Decorator".constantize
    end

    def get_collection(model_class)
      decorator_class.collections
    end

    def to_path(constant)
      constant.name.underscore.gsub '/', '_'
    end

    def search_tab_title(count)
      "#{t("helpers.found")} / #{count}"
    end

    def searchable_model?(model_class)
      model_class.methods.include?(:search) || model_class.methods.include?(:search_everywhere)
    end

    def admin_index_path_of_model(model_class, tab = nil)
      if tab
        records_path model: model_class, scope: tab
      else
        records_path model: model_class
      end
    end

    def tab_title(model_class, tab, count, state_method = :state)
      model = model_class.name.underscore
      name = if t("default.collections.#{tab}").include?('<span')
               t("collections.#{model}.#{tab}").pluralize(:ru)
             else 
               t("default.collections.#{tab}")
             end
      "#{name} / #{count}"
    end

    def active_tab(tab, index)
      return :active if params[:scope].nil? && index == 0
      return :active if params[:search].nil? && params[:scope].to_s == tab.to_s
    end

    #FIXME create independent focus generator
    def focus_selector(index)
      "table:nth-child(2)>tbody>tr:nth-child(#{index - 1})"
    end
  end
end
