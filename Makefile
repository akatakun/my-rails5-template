.PHONY: init_server
init_server:
	ANSIBLE_CONFIG=etc/ansible/ansible.cfg ansible-playbook -i etc/ansible/hosts etc/ansible/bootstrap_server.yaml

.PHONY: init_app
init_app:
	bundle install --path vendor/bundle
	yarn install

.PHONY: run
run:
	bundle exec rails s -b 0.0.0.0
