# frozen_string_literal: true

module Tramway::Admin::SingletonModels
  def set_singleton_models(*models, project:, role: :admin)
    @singleton_models ||= {}
    @singleton_models[project] ||= {}
    @singleton_models[project][role] ||= []
    models.each do |model|
      case model.class
      when Class
        @available_models[project][role] << { model => [ :index, :show, :update, :create, :destroy ] }
      when Hash
        @available_models[project][role] << model
      end
    end
    @singleton_models = @singleton_models.with_indifferent_access
  end

  def singleton_models_for(project, role: :admin)
    models = get_models_by_key(@singleton_models, project, role)
    if project_is_engine?(project)
      models += engine_class(project).dependencies.map do |dependency|
        @singleton_models[dependency]
      end.flatten.compact
    end
    models
  end

  def singleton_models(role:)
    models_array models_type: :singleton, role: role
  end
end
