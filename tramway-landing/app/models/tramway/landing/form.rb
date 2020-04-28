class Tramway::Landing::Form < ApplicationRecord
  has_and_belongs_to_many :blocks, class_name: 'Tramway::Landing::Block', join_table: :tramway_landing_blocks_forms

  enumerize :form_name, in: (Dir[Rails.root.join('app', 'forms', 'public', '**')].map { |f| f.split('/').last.gsub('_form.rb', '').camelize })
end
