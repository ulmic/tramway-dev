module Tramway::Api::V1
  class RecordsController < ::Tramway::Api::V1::ApplicationController
    def index
      records = model_class.active.order(id: :desc).send params[:scope] || :all
      render json: records,
        each_serializer: serializer_class,
        status: :ok
    end

    def create
      record_form = form_class.new
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

    def model_class
      params[:model].constantize
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
