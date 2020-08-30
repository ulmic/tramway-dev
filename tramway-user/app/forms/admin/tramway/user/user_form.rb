# frozen_string_literal: true

class Admin::Tramway::User::UserForm < ::Tramway::Core::ApplicationForm
  self.model_class = Tramway::User::User.is_active

  properties :email, :password, :first_name, :last_name, :role, :phone

  #fix me
  unless self.model_class.columns_hash['project_id'].present?
    validates :email, email: true, uniqueness: true, on: :destroy
  end

  def initialize(object)
    super(object).tap do
      form_properties email: :string,
                      password: :string,
                      first_name: :string,
                      last_name: :string,
                      phone: :string,
                      role: :default
    end
  end
end
