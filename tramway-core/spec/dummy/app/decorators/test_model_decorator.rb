class TestModelDecorator < Tramway::Core::ApplicationDecorator
  decorate_association :association_models
  decorate_association :another_association_models
end