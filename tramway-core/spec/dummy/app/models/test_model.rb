class TestModel < ApplicationRecord
  has_many :association_models, class_name: 'AssociationModel'
  has_many :another_association_models
end
