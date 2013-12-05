{% for p in ['less', 'dstat', 'tmux', 'mosh', 'srm'] %}
{{ p }}:
  pkg:
    - installed
{% endfor %}
