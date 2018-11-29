.PHONY: init_server
init_server:
	ANSIBLE_CONFIG=etc/ansible/ansible.cfg ansible-playbook -i etc/ansible/hosts etc/ansible/bootstrap_server.yaml

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
