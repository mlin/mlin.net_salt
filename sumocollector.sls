sumocollector:
  pkg.installed:
  - require:
    - file: /etc/sumo.conf
  - sources:
    - sumocollector: "https://collectors.sumologic.com/rest/download/deb/64"

/etc/sumo.conf:
  file:
  - exists
