module Tramway::Admin
  class SingletonsController < ApplicationController
    def show
      @singleton = decorator_class.decorate model_class.active.first
    end

    def edit
      @singleton_form = form_class.new model_class.active.first
    end

    def update
      @singleton_form = form_class.new model_class.active.first
      if @singleton_form.submit params[:singleton]
        redirect_to params[:redirect] || singleton_path(model: params[:model])
      else
        render :edit
      end
    end
  end

  private

  # FIXME replace to module
  def singleton_path(*args, **options)
    super args, options.merge(model: params[:model])
  end

  def edit_singleton_path(*args, **options)
    super args, options.merge(model: params[:model])
  end
end
