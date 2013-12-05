# Masterless bootstrap

[Set up ssh key](https://developers.google.com/compute/docs/console#sshkeys), then:

```
ssh XXX.XXX.XXX.XXX 'sudo bash -e -c "wget -O - http://bootstrap.saltstack.org | sh
rm -rf /srv/salt
git clone https://github.com/mlin/mlin.net_salt.git /srv/salt
salt-call --local state.highstate"'
```

# Update

```
ssh XXX.XXX.XXX.XXX 'sudo bash -e -c "cd /srv/salt
git checkout master
git fetch origin
git reset --hard origin/master
salt-call --local state.highstate"'
```

# Enable 2FA (interactive ssh session as root)

```
passwd mlin
apt-get install libqrencode3.deb
GA_DEB_FN="libpam-google-authenticator_20130529-2_amd64.deb"
wget http://http.us.debian.org/debian/pool/main/g/google-authenticator/${GA_DEB_FN} -O /tmp/${GA_DEB_FN}
dpkg -i ${GA_DEB_FN}
su -l mlin -c google-authenticator
echo auth required pam_google_authenticator.so >> /etc/pam.d/sshd
sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
service ssh restart
```
