class Tramway::User::UserForm < ::Tramway::Core::ApplicationForm
  properties :email, :password, :first_name, :last_name, :role

  validates :email, email: true

  def initialize(object)
    super(object).tap do
      form_properties email: :string,
                      password: :string,
                      first_name: :string,
                      last_name: :string,
                      role: :default
    end
  end
end
