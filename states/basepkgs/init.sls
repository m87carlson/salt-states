{% from "basepkgs/map.jinja" import basepkgs with context %}

include:
  {% if grains['os'] == 'FreeBSD' %}
  - pkgng
  {% endif %}
  - ssl
  - vim

base_packages:
  pkg.installed:
    - pkgs:
      {% for required_pkg in basepkgs.required_pkgs %}
      - {{ required_pkg }}
      {% endfor %}
    {% if grains['os'] == 'FreeBSD' %}
    - require:
      - file: pkgng.example.com.conf
    {% endif %}
