module Tramway::Admin::ActionsHelper
  def destroy_is_available?(association_object, main_object)
    ::Tramway::Admin.action_is_available?(
      association_object,
      project: (@application_engine || @application.name),
      model_name: association_object.model.class.name,
      role: current_user.role,
      action: :destroy
    ) 
  end

  def habtm_destroy_is_available?(association_object, main_object)
    ::Tramway::Admin.forms&.include?("#{main_object.model.class.to_s.underscore.pluralize}/remove_#{association_object.model.class.to_s.underscore}")
  end
end
