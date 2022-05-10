all: repos sync

install:
	ansible-playbook -i inventory.ini install.yml -vv

repos:
	ansible-playbook -i inventory.ini repos.yml -vv

sync:
	ansible-playbook -i inventory.ini sync.yml -vv
