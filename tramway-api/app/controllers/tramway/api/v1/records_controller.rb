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
        record_form.model.reload
        render json: record_form.model,
               serializer: serializer_class,
               include: '*',
               status: :created
      else
        render_errors_for record_form
      end
    end

    def update
      record_form = form_class.new record
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
      render json: record,
             serializer: serializer_class,
             include: '*',
             status: :ok
    end

    def destroy
      record.remove
      render json: record,
             serializer: serializer_class,
             include: '*',
             status: :no_content
    end

    private
    
    def record
      if params[:id].present?
        @record = model_class.find_by! uuid: params[:id]
      end
    end

    def check_available_model_class
      unless model_class
        head(:unauthorized) && return unless current_user
        head(:unprocessable_entity) && return
      end
    end

    def check_available_model_action
      action_is_available = checking_roles.map do |role|
        Tramway::Api.action_is_available?(
          record: record,
          action: action_name.to_sym,
          project: (@application_engine || @application.name),
          role: role,
          model_name: params[:model],
          current_user: current_user
        )
      end.include? true

      head(:unprocessable_entity) && return unless action_is_available
    end

    def authenticate_user_if_needed
      action_is_open = Tramway::Api.action_is_available?(
        action: action_name.to_sym,
        project: (@application_engine || @application.name),
        model_name: params[:model]
      )
      head(:unauthorized) && return if !current_user && !action_is_open
    end

    def model_class
      if params[:model].to_s.in? available_models_for_current_user
        begin
          params[:model].constantize
        rescue ActiveSupport::Concern::MultipleIncludedBlocks => e
          raise "#{e}. Maybe #{params[:model]} model doesn't exists or there is naming conflicts with it"
        end
      end
    end

    def available_models_for_current_user
      checking_roles.reduce([]) do |models, role|
        models += ::Tramway::Api.available_models(role: role).map(&:to_s) 
      end
    end

    def checking_roles
      [ :open, current_user&.role ].compact
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
