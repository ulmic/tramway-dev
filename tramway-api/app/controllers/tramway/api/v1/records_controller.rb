module Tramway::Api::V1
  class RecordsController < ::Tramway::Api::V1::ApplicationController
    before_action :check_available_model_class
    before_action :check_available_model_action
    before_action :authenticate_user

    def index
      records = model_class.active.order(id: :desc).send params[:scope] || :all
      render json: records,
        each_serializer: serializer_class,
        status: :ok
    end

    def create
      record_form = form_class.new model_class.new
      if record_form.submit params[:data][:attributes]
        render json: record_form.model,
          serializer: serializer_class,
          status: :created
      else
        render_errors_for record_form
      end
    end

    def update
      record_form = form_class.new model_class.find params[:id]
      if record_form.submit params[:data][:attributes]
        render json: record_form.model,
          serializer: serializer_class,
          status: :ok
      else
        render_errors_for record_form
      end
    end

    private

    def check_available_model_class
      head :unprocessable_entity and return unless model_class
    end

    def check_available_model_action
      head :unprocessable_entity and return unless action_name.in? Tramway::Api.available_models[model_class.to_s].map(&:to_s)
    end

    def model_class
      if params[:model].to_s.in? ::Tramway::Api.available_models.keys.map(&:to_s)
        params[:model].constantize
      end
    end

    def decorator_class(model_name = nil)
      "#{model_name || model_class}Decorator".constantize
    end

    def form_class(model_name = nil)
      "#{model_name || model_class}Form".constantize
    end

    def serializer_class(model_name = nil)
      "#{model_name || model_class}Serializer".constantize
    end
  end
end
