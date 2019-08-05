class PresenceValidator
  def initialize(attributes)
  end

  def valid?(value)
    value.present?
  end
end
