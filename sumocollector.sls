sumocollector:
  pkg.installed:
  - sources:
    - sumocollector: "https://collectors.sumologic.com/rest/download/deb/64"
  require:
  - file: /etc/sumo.conf

/etc/sumo.conf:
  file:
  - exists
