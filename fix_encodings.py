import os

path = "d:/project 2/portal-payments.html"
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

content = content.replace("â‚¹", "&#8377;")
content = content.replace("â€”", "&mdash;")
content = content.replace("â€“", "&ndash;")
content = content.replace("â€\"", "&mdash;")
content = content.replace("â€¢", "&bull;")
content = content.replace("Â·", "&middot;")

with open(path, "w", encoding="utf-8") as f:
    f.write(content)

print("Fixed encodings successfully.")
