Ansible Role: Kibana
=====================

[![Build Status](https://travis-ci.org/redouane/ansible-role-kibana.svg?branch=master)](https://travis-ci.org/redouane/ansible-role-kibana)

Installs and configures Kibana

Requirements
------------

None

Role Variables
--------------

```yaml

kibana_version: 4.2.0
kibana_port: 5601
kibana_host: 0.0.0.0
kibana_elasticsearch_url: http://localhost:9200
kibana_default_app: discover
kibana_install_dir: /opt
kibana_user: kibana

```

License
-------

BSD