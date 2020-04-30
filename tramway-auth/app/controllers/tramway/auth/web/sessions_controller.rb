# frozen_string_literal: true

module Tramway::Auth
  module Web
    class SessionsController < ::Tramway::Auth::Web::ApplicationController
      before_action :redirect_if_signed_in, except: :destroy

      def new
        @session_form = ::Tramway::Auth::SessionForm.new ::Tramway::User::User.new
      end

      def create
        binding.pry
        @session_form = ::Tramway::Auth::SessionForm.new ::Tramway::User::User.active.find_or_initialize_by email: params[:user][:email]
        if @session_form.validate params[:user]
          sign_in @session_form.model
          redirect_to params[:redirect] || ::Tramway::Auth.root_path_for(@session_form.model.class)
        else
          render :new
        end
      end

      def destroy
        root_path = ::Tramway::Auth.root_path_for(current_user.class)
        sign_out params[:model]
        redirect_to root_path
      end

      private

      def redirect_if_signed_in
        redirect_to ::Tramway::Auth.root_path_for(current_user.class) if signed_in?(params[:model].constantize) && request.env['PATH_INFO'] != ::Tramway::Auth.root_path_for(current_user.class)
      end
    end
  end
end
