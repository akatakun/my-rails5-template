.PHONY: initialize_production_server
initialize_production_server:
	ANSIBLE_CONFIG=etc/ansible/ansible.cfg ansible-playbook -i etc/ansible/hosts etc/ansible/bootstrap_server.yaml
