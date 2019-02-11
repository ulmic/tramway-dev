class Tramway::Core::Application
  attr_accessor :name, :url, :model_class

  def public_name
    name.to_s.gsub('_', ' ').camelize
  end
end
