class Tramway::Site::PersonDecorator < Tramway::Core::ApplicationDecorator
  class << self
    def show_attributes
      [:full_name, :short_bio, :bio, :photo]
    end
  end

  delegate :short_bio, to: :object
  delegate :bio, to: :object
  delegate :photo, to: :object

  def full_name
    object.names.join ' '
  end
end
