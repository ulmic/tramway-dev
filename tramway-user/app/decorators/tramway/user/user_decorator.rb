# frozen_string_literal: true

class Tramway::User::UserDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      [:email]
    end

    def show_attributes
      [:email, :first_name, :last_name, :role, :created_at, :updated_at]
    end
  end

  delegate :first_name, to: :object
  delegate :last_name, to: :object
  delegate :email, to: :object
  delegate :role, to: :object
  delegate :created_at, to: :object
  delegate :updated_at, to: :object

  def name
    "#{object.first_name} #{object.last_name}"
  end

  delegate :email, to: :object
end
