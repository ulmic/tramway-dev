class Tramway::Admin::HasAndBelongsToManyRecordsController < ::Tramway::Admin::ApplicationController
  def create
    base_object = params[:model_class].constantize.find params[:object_id]
    record_form = params[:form].constantize.new base_object
    if record_form.submit params[params[:model_class].underscore]
      redirect_to params[:redirect].present? ? params[:redirect] : record_path(base_object, model: base_object.class)
    else
      redirect_to params[:redirect].present? ? params[:redirect] : record_path(base_object, model: base_object.class)
    end
  end

  def destroy
    base_object = params[:model_class].constantize.find params[:object_id]
    record_form = params[:form].constantize.new base_object
    if record_form.submit params[:id]
      redirect_to params[:redirect].present? ? params[:redirect] : record_path(base_object, model: base_object.class)
    else
      redirect_to params[:redirect].present? ? params[:redirect] : record_path(base_object, model: base_object.class)
    end
  end
end
