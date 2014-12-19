{% if grains['kernel'] == 'FreeBSD' %}
pkgng.example.com.conf:
  file.managed:
    - name: /etc/pkg/Default.conf
    - source: salt://pkgng/pkgng.example.com.conf.jinja
    - template: jinja

/etc/pkg/pkgng.example.com.pub:
   file.managed:
      - source: salt://pkgng/pkgng.example.com.pub

{% endif %}
