class Tramway::User::User < ::Tramway::Core::ApplicationRecord
  has_secure_password #FIXME remove repeating from tramway-user

  enumerize :role, in: [ :user, :admin ], default: :user

  def admin?
    role.admin?
  end
end
