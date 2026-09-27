import { useState } from 'react'

export default function App() {
  const [n, setN] = useState(0)
  return (
    <main style={{ fontFamily: 'system-ui', textAlign: 'center', marginTop: '20vh', color: '#e2e8f0', background: '#0f172a', minHeight: '80vh', padding: '2rem' }}>
      <h1>React on shpyrd</h1>
      <p>Built with Vite by the Node buildpack (<code>BP_NODE_RUN_SCRIPTS=build</code>), served by nginx from <code>dist/</code>.</p>
      <button onClick={() => setN(n + 1)} style={{ fontSize: '1.2rem', padding: '.5rem 1rem' }}>clicked {n} times</button>
    </main>
  )
}
