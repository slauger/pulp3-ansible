# pulp3-ansible

Playbooks for creating and syncing rpm repositories in Pulp 3 via pulp CLI.

## dependencies

- make
- ansible
- jq
- pulp-cli

## setup pulp server

```
make install
```

## prepare pulp-cli

```
podman exec -it pulp bash -c 'pulpcore-manager reset-admin-password'
```

```
apt-get install python3-pip
pip3 install pulp-cli[pygments]
pulp config create --username admin --base-url https://repo01.xxx.tld --password <admin password>
```

## create repos

```
make repos
``` 

## sync repos

```
make sync
```

## debug

### reset nat

```
iptables -t filter -F
iptables -t filter -X
iptables -t nat -F
iptables -t nat -X
```
