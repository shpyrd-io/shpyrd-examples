import os
from flask import Flask, request

# Flask served by gunicorn (Procfile). The Python buildpack installs
# requirements.txt.
app = Flask(__name__)


@app.get("/")
def index():
    who = request.headers.get("X-Shpyrd-User", "anonymous visitor")
    return f'''<!doctype html><html lang="en"><head><meta charset="utf-8"><title>example-python</title>
<style>body{{font-family:system-ui;background:#0f172a;color:#e2e8f0;text-align:center;padding-top:20vh}}code{{background:#1e293b;padding:.15rem .4rem;border-radius:.3rem}}</style></head>
<body><h1>Python on shpyrd</h1><p>Hello, <code>{who}</code>. Flask behind gunicorn.</p>
<p>Project <code>{os.environ.get("SHPYRD_PROJECT", "")}</code>, workspace <code>{os.environ.get("SHPYRD_WORKSPACE", "")}</code>.</p></body></html>'''


@app.get("/healthz")
def healthz():
    return "ok"
