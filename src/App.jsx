import './App.css'

function App() {
  return (
    <div className="app">
      <header className="header">
        <h1>Aula DevOps</h1>
        <p className="subtitle">SATC</p>
      </header>

      <main className="content">
        <section className="card">
          <h2>O que é DevOps?</h2>
          <p>
            DevOps é uma forma de trabalhar que junta desenvolvimento e operações para entregar software mais rápido e com menos erros, usando automação e colaboração.
          </p>
        </section>

        <section className="card">
          <h2>SRE (Site Reliability Engineering)</h2>
          <p>
            SRE é uma prática que aplica engenharia para manter sistemas estáveis e confiáveis, focando em disponibilidade, desempenho e resposta a falhas.
          </p>
        </section>

        <footer className="footer">
          <p>DevOps SATC — Aula prática</p>
        </footer>
      </main>
    </div>
  )
}

export default App
