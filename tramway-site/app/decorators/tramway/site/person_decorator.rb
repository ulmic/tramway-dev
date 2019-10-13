# frozen_string_literal: true

class Tramway::Site::PersonDecorator < Tramway::Core::ApplicationDecorator
  class << self
    def show_attributes
      %i[full_name short_bio bio photo]
    end
  end

  delegate :short_bio, to: :object

  def full_name
    object.names.join ' '
  end

  def bio
    raw object.bio
  end

  def photo
    image_view object.photo
  end
end
