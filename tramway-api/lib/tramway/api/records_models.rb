# frozen_string_literal: true

module Tramway::Api::RecordsModels
  def set_available_models(*models, project:, role: :open)
    @available_models ||= {}
    @available_models[project] ||= {}
    @available_models[project][role] ||= {}
    models.each do |model|
      if model.class == Class
        @available_models[project][role].merge! model => %i[index show update create destroy]
      elsif model.class == Hash
        @available_models[project][role].merge! model
      end
    end
    @available_models = @available_models.with_indifferent_access
  end

  def available_models_for(project, role: :open)
    models = get_models_by_key(@available_models, project, role)
    if project_is_engine?(project)
      models += engine_class(project).dependencies.map do |dependency|
        if @available_models&.dig(dependency, role).present?
          @available_models&.dig(dependency, role).keys
        else
          error = Tramway::Error.new(
            plugin: :admin,
            method: :available_models_for,
            message: "There is no dependency `#{dependency}` for plugin: #{project}. Please, check file `tramway-#{project}/lib/tramway/#{project}/#{project}.rb`"
          )
          raise error
        end
      end.flatten.compact
    end
    models
  end

  def available_models(role:)
    models_array models_type: :available, role: role
  end
end
