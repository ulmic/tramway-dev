module Tramway::Admin::SingletonModels
  def set_singleton_models(*models, project:, role: :admin)
    @singleton_models ||= {}
    @singleton_models[project] ||= {}
    @singleton_models[project][role] ||= []
    @singleton_models[project][role] += models
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
    if @singleton_models
      @singleton_models.map do |projects|
        projects[1][role]
      end.flatten
    else
      error = Tramway::Error.new(plugin: :admin, method: :singleton_models, message: 'List of singleton_models is empty. You should add some of them using `::Tramway::Admin.set_singleton_models(*list_of_classes, project: :your_project_name)` in `config/initializers/tramway.rb`')
      raise error.message
    end
  end
end
