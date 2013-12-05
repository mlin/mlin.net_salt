sumocollector:
  require:
  - file: /etc/sumo.conf
  pkg.installed:
  - sources:
    - sumocollector: "https://collectors.sumologic.com/rest/download/deb/64"

/etc/sumo.conf:
  file:
  - exists
