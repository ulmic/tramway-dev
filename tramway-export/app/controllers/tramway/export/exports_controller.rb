require 'xls_exporter'

class Tramway::Export::ExportsController < Tramway::Export::ApplicationController
  def show
    scope = params[:scope].present? ? params[:scope] : :all
    model_class = model_class_name(params[:model])
    xlsx_decorator_class = xlsx_decorator_class_name(params[:model])
    records = xlsx_decorator_class.decorate model_class.active.order(id: :desc).send scope

    book = ::XlsExporter.export do
      add_sheet 'List'

      export_models records, *xlsx_decorator_class.columns
    end
    stream = StringIO.new
    book.write stream 
    send_data stream.string, content_type: 'application/xlsx', filename: xlsx_decorator_class.filename
  end

  private
  
  def xlsx_decorator_class_name(model_name)
    "#{model_name}XlsxDecorator".constantize
  end
end
