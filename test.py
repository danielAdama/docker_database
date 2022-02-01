from jinja2 import Template

t = Template('Name {{ name }}')

print(t.render(name = 'Jerry'))
