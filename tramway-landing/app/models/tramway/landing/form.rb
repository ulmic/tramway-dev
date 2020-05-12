# frozen_string_literal: true

class Tramway::Landing::Form < ApplicationRecord
  belongs_to :block, class_name: 'Tramway::Landing::Block'

  enumerize :form_name, in: (Dir[Rails.root.join('app', 'forms', 'public', '**')].map { |f| f.split('/').last.gsub('_form.rb', '') })
end
