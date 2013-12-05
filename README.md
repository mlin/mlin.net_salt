# Masterless bootstrap

[Set up ssh key](https://developers.google.com/compute/docs/console#sshkeys), then:

```
ssh XXX.XXX.XXX.XXX 'sudo bash -e -c "wget -O - http://bootstrap.saltstack.org | sh
rm -rf /srv/salt
git clone https://github.com/mlin/mlin.net_salt.git /srv/salt
salt-call --local state.highstate"'
```

## Update

```
ssh XXX.XXX.XXX.XXX 'sudo bash -e -c "cd /srv/salt
git checkout master
git fetch origin
git reset --hard origin/master
salt-call --local state.highstate"'
```
