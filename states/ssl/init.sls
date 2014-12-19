{% from "ssl/map.jinja" import ssl with context %}

{{ ssl.cabundle_path }}:
  file.managed:
    - source: salt://ssl/cert.pem
    - mode: 744

{{ ssl.ca_cert_dir }}:
  file.recurse:
    - source: salt://ssl/certs
    - include_empty: True

{% if grains.os_family != 'Windows' %}
update_ca_certs:
  cmd.run:
    - name: {{ ssl.update_ca_certificates }}
{% endif %}

{% if grains.os == 'FreeBSD' %}
ca_root_nss:
  pkg:
    - installed
{% endif %}

{% if grains.os == 'Ubuntu' %}
/etc/ca-certificates.conf:
  file.append:
    - text:
      - ExampleCorp/RootCA.crt
      - ExampleCorp/ExampleCorpServerCA.crt
{% endif %}
