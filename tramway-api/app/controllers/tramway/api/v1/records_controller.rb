module Tramway::Api::V1
  class RecordsController < ::Tramway::Api::V1::ApplicationController
    before_action :check_available_model_class
    before_action :check_available_model_action
    before_action :authenticate_user_if_needed

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
      record_form = form_class.new model_class.active.find params[:id]
      if record_form.submit params[:data][:attributes]
        render json: record_form.model,
          serializer: serializer_class,
          status: :ok
      else
        render_errors_for record_form
      end
    end

    def show
      record = model_class.active.find params[:id]
      render json: record,
        serializer: serializer_class,
        status: :ok
    end

    def destroy
      record = model_class.active.find params[:id]
      record.remove
      render json: record,
        serializer: serializer_class,
        status: :no_content
    end

    private

    def check_available_model_class
      head :unprocessable_entity and return unless model_class
    end

    def check_available_model_action
      open_actions = Tramway::Api.available_models[model_class.to_s][:open]&.map(&:to_s) || []
      closed_actions =  Tramway::Api.available_models[model_class.to_s][:closed]&.map(&:to_s) || []
      head :unprocessable_entity and return unless action_name.in? open_actions + closed_actions
    end

    def authenticate_user_if_needed
      if action_name.in? Tramway::Api::available_models[model_class.to_s][:closed]&.map(&:to_s) || []
        authenticate_user
      end
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
