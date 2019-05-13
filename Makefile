.PHONY: run
run: init_wpack
	bundle exec foreman start

.PHONY: run_rails
run_rails: init_wpack
	bundle exec bin/rails server --binding=0.0.0.0

.PHONY: init_rails
init_rails:
	bundle config build.nokogiri --use-system-libraries
	bundle install --path vendor/bundle

.PHONY: run_wpack
run_wpack: init_wpack
	bundle exec bin/webpack-dev-server

.PHONY: init_wpack
init_wpack: init_rails
	bundle exec bin/yarn install
