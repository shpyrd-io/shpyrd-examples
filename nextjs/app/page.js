export const dynamic = 'force-dynamic'

export default function Page() {
  return (
    <main style={{ textAlign: 'center', paddingTop: '20vh' }}>
      <h1>Next.js on shpyrd</h1>
      <p>Server-rendered at {new Date().toISOString()} by <code>next start</code> on port {process.env.PORT}.</p>
      <p>Project <code>{process.env.SHPYRD_PROJECT}</code> in workspace <code>{process.env.SHPYRD_WORKSPACE}</code>.</p>
    </main>
  )
}
