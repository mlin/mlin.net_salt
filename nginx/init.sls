nginx:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf

/etc/nginx/nginx.conf:
  - file.exists

/home/mlin/www:
  file.directory:
  - user: mlin
  - group: www-data
  - dir_mode: 755

/etc/nginx/sites-enabled/mlin.net:
  file:
    - managed
    - source: salt://nginx/sites-enabled.mlin.net
    - user: root
    - group: root
    - mode: 644
