# frozen_string_literal: true

module Tramway::Api::V1
  class RecordsController < ::Tramway::Api::V1::ApplicationController
    before_action :check_available_model_class
    before_action :check_available_model_action
    before_action :authenticate_user_if_needed

    def index
      records = model_class.active.order(id: :desc).send params[:scope] || :all
      records = records.full_text_search params[:search] if params[:search]
      render json: records,
             each_serializer: serializer_class,
             include: '*',
             status: :ok
    end

    def create
      record_form = form_class.new model_class.new
      if record_form.submit snake_case params[:data][:attributes]
        render json: record_form.model,
               serializer: serializer_class,
               include: '*',
               status: :created
      else
        render_errors_for record_form
      end
    end

    def update
      record_form = form_class.new model_class.active.find params[:id]
      if record_form.submit snake_case params[:data][:attributes]
        render json: record_form.model,
               serializer: serializer_class,
               include: '*',
               status: :ok
      else
        render_errors_for record_form
      end
    end

    def show
      record = model_class.active.find params[:id]
      render json: record,
             serializer: serializer_class,
             include: '*',
             status: :ok
    end

    def destroy
      record = model_class.active.find params[:id]
      record.remove
      render json: record,
             serializer: serializer_class,
             include: '*',
             status: :no_content
    end

    private

    def check_available_model_class
      head(:unprocessable_entity) && return unless model_class
    end

    def check_available_model_action
      open_actions = Tramway::Api.available_models[model_class.to_s][:open]&.map(&:to_s) || []
      closed_actions = Tramway::Api.available_models[model_class.to_s][:closed]&.map(&:to_s) || []
      head(:unprocessable_entity) && return unless action_name.in? open_actions + closed_actions
    end

    def authenticate_user_if_needed
      if action_name.in?(Tramway::Api.available_models[model_class.to_s][:closed]&.map(&:to_s) || []) && !current_user
        head(:unauthorized) && return
      end
    end

    def model_class
      if params[:model].to_s.in? ::Tramway::Api.available_models.keys.map(&:to_s)
        begin
          params[:model].constantize
        rescue ActiveSupport::Concern::MultipleIncludedBlocks => e
          raise "#{e}. Maybe #{params[:model]} model doesn't exists or there is naming conflicts with it"
        end
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
