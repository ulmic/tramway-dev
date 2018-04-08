namespace :tramway do
  namespace :conference do
    task :prepare do
      ::Tramway::Conference::Unity.create!
    end
  end
end
