module Tramway::Api::V1
  class RecordsController < ::Tramway::Api::V1::ApplicationController
    def index
      records = model_class.active.order(id: :desc).send params[:scope] || :all
      render json: records,
        meta: meta_pagination(records),
        each_serializer: serializer,
        status: :ok
    end
  end
end
