import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

function healthEndpoint() {
  const handler = (req, res, next) => {
    if (req.method === 'GET') {
      res.statusCode = 200
      res.setHeader('Content-Type', 'text/plain')
      res.end('OK')
      return
    }
    next()
  }

  return {
    name: 'health-endpoint',
    configureServer(server) {
      server.middlewares.use('/health', handler)
    },
    configurePreviewServer(server) {
      server.middlewares.use('/health', handler)
    },
  }
}

export default defineConfig({
  plugins: [react(), healthEndpoint()],
})
