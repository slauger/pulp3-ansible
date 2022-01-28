all: repos sync

repos:
	ansible-playbook -i inventory.ini repos.yml -vv

sync:
	ansible-playbook -i inventory.ini sync.yml -vv
