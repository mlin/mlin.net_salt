{% for p in ['less', 'dstat', 'tmux', 'mosh', 'secure-delete'] %}
{{ p }}:
  pkg:
    - installed
{% endfor %}
