module Tramway
  module Admin
    module RecordRoutesHelper
      def record_path(*args, **options)
        super args, options.merge(model: params[:model])
      end

      def edit_record_path(*args, **options)
        super args, options.merge(model: params[:model])
      end

      def new_record_path(*args, **options)
        super args, options.merge(model: params[:model])
      end

      def records_path(*args, **options)
        super args, options.merge(model: params[:model])
      end
    end
  end
end
