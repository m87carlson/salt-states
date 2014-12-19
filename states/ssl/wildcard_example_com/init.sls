{% from "ssl/map.jinja" import ssl with context %}

wildcard_example.com.crt:
   file.managed:
      - name: {{ ssl.path.wildcard_example_com.cert }}
      - contents_pillar: ssl:example_com:cert:wildcard_example.com_chain
      - makedirs: True

wildcard_example.com.key:
   file.managed:
      - name: {{ ssl.path.wildcard_example_com.key }}
      - contents_pillar: ssl:example_com:key:wildcard_example.com
      - makedirs: True


