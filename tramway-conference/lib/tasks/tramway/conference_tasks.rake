# frozen_string_literal: true

namespace :tramway do
  namespace :conference do
    task :prepare do
      ::Tramway::Conference::Unity.create!
    end
  end
end
