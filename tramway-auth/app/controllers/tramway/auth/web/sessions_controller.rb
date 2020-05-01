# frozen_string_literal: true

module Tramway::Auth
  module Web
    class SessionsController < ::Tramway::Auth::Web::ApplicationController
      before_action :redirect_if_signed_in, except: :destroy

      def new
        @application = Tramway::Core.application&.model_class&.first || Tramway::Core.application
        @session_form = ::Tramway::Auth::SessionForm.new ::Tramway::User::User.new
      end

      def create
        @session_form = ::Tramway::Auth::SessionForm.new ::Tramway::User::User.active.find_or_initialize_by email: params[:user][:email]
        if @session_form.validate params[:user]
          sign_in @session_form.model
          redirect_to ::Tramway::Auth.root_path
        else
          render :new
        end
      end

      def destroy
        sign_out
        redirect_to ::Tramway::Auth.root_path
      end

      private

      def redirect_if_signed_in
        redirect_to ::Tramway::Auth.root_path if signed_in? && request.env['PATH_INFO'] != ::Tramway::Auth.root_path
      end
    end
  end
end
