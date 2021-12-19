# frozen_string_literal: true

require 'xls_exporter'

class Tramway::Export::ExportsController < Tramway::Admin::ApplicationController
  def index
    scope = params[:scope].present? ? params[:scope] : :all
    model_class = model_class_name(params[:model])
    xls_decorator_class = xls_decorator_class_name(params[:model])
    records = model_class.order(id: :desc).send scope
    records = records.ransack(params[:filter]).result if params[:filter].present?
    records = records.send "#{current_admin.role}_scope", current_admin.id
    records = xls_decorator_class.decorate records

    columns = xls_decorator_class.columns + records.map(&:flexible_columns).flatten.uniq do |hash|
      hash&.keys&.first
    end

    book = ::XlsExporter.export do
      default_style horizontal_align: :center, vertical_align: :center, text_wrap: true

      add_sheet 'List'

      export_models records, *columns
    end
    stream = StringIO.new
    book.write stream
    send_data stream.string, content_type: 'application/xls', filename: xls_decorator_class.filename
  end

  def show
    head(:unprocessable_entity) && return unless available?

    model_class = model_class_name(params[:model])
    xls_collection_decorator_class = xls_collection_decorator_class_name(params[:model], params[:collection])
    records = model_class.find(params[:id]).send(params[:collection]).order(id: :desc)
    records = records.send "#{current_admin.role}_scope", current_admin.id
    records = xls_collection_decorator_class.decorate records

    columns = xls_collection_decorator_class.columns + records.map(&:flexible_columns).flatten.uniq do |hash|
      hash&.keys&.first
    end

    book = ::XlsExporter.export do
      default_style horizontal_align: :center, vertical_align: :center, text_wrap: true

      add_sheet xls_collection_decorator_class.sheet_name

      export_models records, *columns
    end
    stream = StringIO.new
    book.write stream
    send_data stream.string, content_type: 'application/xls', filename: xls_collection_decorator_class.filename
  end

  private

  def xls_decorator_class_name(model_name)
    "#{model_name}XlsDecorator".constantize
  end

  def xls_collection_decorator_class_name(model_name, collection)
    "#{model_name}::#{collection.camelize}XlsDecorator".constantize
  end

  def available?
    if params[:collection].present?
      ::Tramway::Export.exportable_model?(model_class, project: @application.name) && Tramway::Export.exportable_models(project: @application.name)&.map do |config|
        config.is_a?(Hash) && config.values.first.map(&:to_s).include?(params[:collection])
      end&.include?(true)
    else
      ::Tramway::Export.exportable_model?(params[:model], project: @application.name)
    end
  end
end
