test:
	cd tramway-core/spec/dummy && RAILS_ENV=test rails db:create db:migrate
	cd tramway-core && LOCALE=ru rake
	cd tramway-core && LOCALE=en rake

install:
	cd tramway-core && bundle
