### Enable 2FA

[Set up ssh key](https://developers.google.com/compute/docs/console#sshkeys), connect and open interactive session as root:

```
passwd mlin
apt-get install libqrencode3
GA_DEB_FN="libpam-google-authenticator_20130529-2_amd64.deb"
wget http://http.us.debian.org/debian/pool/main/g/google-authenticator/${GA_DEB_FN} -O /tmp/${GA_DEB_FN}
dpkg -i ${GA_DEB_FN}
su -l mlin -c google-authenticator
echo auth required pam_google_authenticator.so >> /etc/pam.d/sshd
sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
service ssh restart
```

### Masterless bootstrap

```
sudo bash -e -c "wget -O - http://bootstrap.saltstack.org | sh
git clone https://github.com/mlin/mlin.net_salt.git /srv/salt
salt-call --local state.highstate"
```

### Update

```
sudo bash -e -c "cd /srv/salt
git checkout master
git fetch origin
git reset --hard origin/master
salt-call --local state.highstate"
```

### Checking on things

```
salt-call --local state.show_highstate
salt-call --local pillar.items
```

salt-call help:

```
salt-call --local sys.doc | less
```

### Firewall

- tcp:22 (ssh)
- udp:60000-61000 (mosh)
- tcp:80,443 (www)

