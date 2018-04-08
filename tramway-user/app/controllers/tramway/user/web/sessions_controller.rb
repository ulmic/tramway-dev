module Tramway::User
  module Web
    class SessionsController < ::Tramway::User::Web::ApplicationController
      before_action :redirect_if_signed_in, except: :destroy

      def new
        @session_form = ::Tramway::User::SessionForm.new ::Tramway::User::User.new
      end

      def create
        @session_form = ::Tramway::User::SessionForm.new User.find_or_initialize_by email: params[:user][:email]
        if @session_form.validate params[:user]
          sign_in @session_form.model
          redirect_to ::Tramway::User.root_path
        else
          render :new
        end
      end

      def destroy
        sign_out
        redirect_to root_path
      end

      private

      def redirect_if_signed_in
        redirect_to ::Tramway::User.root_path if signed_in?
      end
    end
  end
end
