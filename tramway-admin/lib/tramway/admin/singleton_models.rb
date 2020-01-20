module Tramway::Admin::SingletonModels
  def set_singleton_models(*models, project:, role: :admin)
    @singleton_models ||= {}
    @singleton_models[project] ||= {}
    @singleton_models[project][role] ||= []
    @singleton_models[project][role] += models
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

  def singleton_models
    @singleton_models&.values&.flatten || []
  end
end
