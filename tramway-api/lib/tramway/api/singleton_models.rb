# frozen_string_literal: true

module Tramway::Api::SingletonModels
  def set_singleton_models(*models, project:, role: :open)
    @singleton_models ||= {}
    @singleton_models[project] ||= {}
    @singleton_models[project][role] ||= {}
    models.each do |model|
      if model.class == Class
        @singleton_models[project][role].merge! model => %i[index show update create destroy]
      elsif model.class == Hash
        @singleton_models[project][role].merge! model
      end
    end
    @singleton_models = @singleton_models.with_indifferent_access
  end

  def singleton_models_for(project, role: :open)
    models = get_models_by_key(@singleton_models, project, role)
    if project_is_engine?(project)
      models += engine_class(project).dependencies.map do |dependency|
        @singleton_models&.dig(dependency, role)&.keys
      end.flatten.compact
    end
    models
  end

  def singleton_models(role:)
    models_array models_type: :singleton, role: role
  end
end
