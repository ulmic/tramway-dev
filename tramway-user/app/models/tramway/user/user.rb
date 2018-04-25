class Tramway::User::User < ::Tramway::Core::ApplicationRecord
  has_secure_password

  # FIXME replace to tramway-admin
  enumerize :role, in: [ :user, :admin ], default: :user

  def admin?
    role.admin?
  end
end
