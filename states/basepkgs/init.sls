{% from "basepkgs/map.jinja" import basepkgs with context %}

include:
  - ssl
  - vim

base_packages:
  pkg.installed:
    - pkgs:
{% for required_pkg in basepkgs.required_pkgs %}
      - {{ required_pkg }}
{% endfor %}

{% if grains['kernel'] == 'FreeBSD' %}
pkgng.example.com.conf:
  file.managed:
    - name: /etc/pkg/Default.conf
    - source: salt://basepkgs/pkgng.example.com.conf.jinja
    - template: jinja

/etc/pkg/pkgng.example.com.pub:
   file.managed:
      - source: salt://basepkgs/pkgng.example.com.pub

{% endif %}
