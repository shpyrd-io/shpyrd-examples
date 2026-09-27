import { useEffect, useState } from 'react'

export default function App() {
  const [hello, setHello] = useState(null)
  useEffect(() => { fetch('/api/hello').then(r => r.json()).then(setHello) }, [])
  return (
    <main style={{ fontFamily: 'system-ui', textAlign: 'center', marginTop: '20vh', color: '#e2e8f0', background: '#0f172a', minHeight: '80vh', padding: '2rem' }}>
      <h1>React + Sinatra, one project</h1>
      <p>The frontend is built in the Dockerfile's first stage; Sinatra serves it and the API.</p>
      <pre style={{ background: '#1e293b', display: 'inline-block', padding: '1rem', borderRadius: '.5rem', textAlign: 'left' }}>{hello ? JSON.stringify(hello, null, 2) : 'loading /api/hello...'}</pre>
    </main>
  )
}
