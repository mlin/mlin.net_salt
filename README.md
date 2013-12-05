# Masterless deploy

[Set up ssh key](https://developers.google.com/compute/docs/console#sshkeys), then:

```
ssh XXX.XXX.XXX.XXX 'sudo bash -c "wget -O - http://bootstrap.saltstack.org | sh
git clone https://github.com/mlin/mlin.net_salt.git /srv/salt
salt-call --local state.highstate -l debug"'
```
