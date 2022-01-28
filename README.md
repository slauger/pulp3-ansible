# pulp3-ansible

## preconfigure pulp3

Example for `settings/settings.py`

```
CONTENT_ORIGIN='https://repo01.xxx.tld'
ANSIBLE_API_HOSTNAME='https://repo01.xxx.tld'
ANSIBLE_CONTENT_HOSTNAME='https://repo01.xxx.tld/pulp/content'
TOKEN_AUTH_DISABLED=True
ALLOWED_CONTENT_CHECKSUMS = ["md5", "sha1", "sha224", "sha256", "sha384", "sha512"]
```

## run pulp3 via podman

```
podman run -it -d \
  --publish 8080:80 \
  --name pulp --rm \
  --volume "$(pwd)/settings":/etc/pulp \
  --volume "$(pwd)/pulp_storage":/var/lib/pulp \
  --volume "$(pwd)/pgsql":/var/lib/pgsql \
  --volume "$(pwd)/containers":/var/lib/containers \
  --device /dev/fuse \
	docker.io/pulp/pulp:3.17
```

## reset nat

```
iptables -t filter -F
iptables -t filter -X
iptables -t nat -F
iptables -t nat -X
```

## pulp-cli

```
pip install pulp-cli[pygments]
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
