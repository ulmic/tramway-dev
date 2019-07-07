class Tramway::Site::Person < Tramway::Site::ApplicationRecord
  def title
    names.join(' ')
  end
end
