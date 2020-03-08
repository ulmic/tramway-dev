# frozen_string_literal: true

require 'xls_exporter'

class Tramway::Export::ExportsController < Tramway::Admin::ApplicationController
  def show
    scope = params[:scope].present? ? params[:scope] : :all
    model_class = model_class_name(params[:model])
    xls_decorator_class = xls_decorator_class_name(params[:model])
    records = model_class.active.order(id: :desc).send scope
    records = records.ransack(params[:filter]).result if params[:filter].present?
    records = records.send "#{current_user.role}_scope", current_user.id
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

  private

  def xls_decorator_class_name(model_name)
    "#{model_name}XlsDecorator".constantize
  end
end
