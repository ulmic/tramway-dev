class AssociationModel < ApplicationRecord
  belongs_to :test_model, class_name: 'TestModel'
end
