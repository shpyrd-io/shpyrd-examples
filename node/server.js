// Express: the Node buildpack installs dependencies and runs "npm start".
const express = require('express')
const app = express()
const port = process.env.PORT || 8080

app.get('/', (req, res) => {
  const who = req.get('X-Shpyrd-User') || 'anonymous visitor'
  res.type('html').send(`<!doctype html><html lang="en"><head><meta charset="utf-8"><title>example-node</title>
<style>body{font-family:system-ui;background:#0f172a;color:#e2e8f0;text-align:center;padding-top:20vh}code{background:#1e293b;padding:.15rem .4rem;border-radius:.3rem}</style></head>
<body><h1>Node.js ${process.version} on shpyrd</h1><p>Hello, <code>${who}</code>. Express ${require('express/package.json').version}.</p>
<p>Project <code>${process.env.SHPYRD_PROJECT}</code>, workspace <code>${process.env.SHPYRD_WORKSPACE}</code>.</p></body></html>`)
})
app.get('/healthz', (req, res) => res.send('ok'))
app.listen(port, () => console.log(`listening on :${port}`))
