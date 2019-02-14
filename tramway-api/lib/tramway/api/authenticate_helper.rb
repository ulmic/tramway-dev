module Tramway::Api::AuthenticateHelper
  def authenticate
    raise ActiveRecord::RecordNotFound unless entity.present? && entity.authenticate(auth_params[:password])
  end

  def auth_token
    if entity.respond_to? :to_token_payload
      Knock::AuthToken.new payload: entity.to_token_payload
    else
      Knock::AuthToken.new payload: { sub: entity.id }
    end
  end

  def entity
    @entity ||=
      if Tramway::Api.user_based_model.respond_to? :from_token_request
        Tramway::Api.user_based_model.from_token_request request
      else
        Tramway::Api.user_based_model.find_by email: auth_params[:email]
      end
  end

  def auth_params
    params.require(:auth).permit :email, :password
  end
end
