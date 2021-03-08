# frozen_string_literal: true

module Tramway::Api::V1
  class RecordsController < ::Tramway::Api::V1::ApplicationController
    before_action :check_available_model_class
    before_action :check_available_model_action_for_record, only: %i[show update destroy]
    before_action :authenticate_user_if_needed
    before_action :application

    def index
      @collection = available_action_for_collection

      raise 'Collection has empty uuid. It should not be empty, because all records with empty uuid will not be rendered' if @collection.map(&:uuid).map(&:empty?).include? true

      render json: @collection,
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

    def application
      if ::Tramway::Core.application
        @application = Tramway::Core.application&.model_class&.first || Tramway::Core.application
      end
    end
  end
end
