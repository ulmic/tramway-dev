# frozen_string_literal: true

class Admin::Tramway::User::UserForm < ::Tramway::Core::ApplicationForm
  self.model_class = Tramway::User::User

  properties :email, :password, :first_name, :last_name, :role, :phone

  validates :email, email: true
  validates :email, uniqueness: true, if: 'active?'

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
