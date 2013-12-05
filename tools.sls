{% for p in ['less', 'dstat', 'tmux' 'mosh'] %}
{{ p }}:
  pkg:
    -installed

{% endfor %}
