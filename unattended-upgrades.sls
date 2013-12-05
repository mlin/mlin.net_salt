unattended-upgrades: 
  pkg.installed: 
  - name: unattended-upgrades
  debconf.set: 
  - name: unattended-upgrades 
  - data: 
        'unattended-upgrades/enable_auto_updates': {'type': 'boolean', 'value':  True} 
  cmd.run: 
  - name: dpkg-reconfigure -fnoninteractive unattended-upgrades 
  - watch: 
    - debconf: unattended-upgrades 
