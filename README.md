# DevOps SATC

Aplicação simples em **React + Vite** sobre a Aula DevOps, com uma página que apresenta conceitos de DevOps e SRE.

- **DevOps** é uma forma de trabalhar que junta desenvolvimento e operações para entregar software mais rápido e com menos erros, usando automação e colaboração.
- **SRE (Site Reliability Engineering)** é uma prática que aplica engenharia para manter sistemas estáveis e confiáveis, focando em disponibilidade, desempenho e resposta a falhas.

---

## Pré-requisitos

- [Node.js](https://nodejs.org/) (versão 18 ou superior recomendada)
- npm (já vem com o Node.js)

## Instalação

1. **Clone o repositório** (se ainda não tiver):

   ```bash
   git clone <url-do-repositorio>
   cd devops-satc
   ```

2. **Instale as dependências**:

   ```bash
   npm install
   ```

## Como rodar a aplicação

### Modo desenvolvimento

Para abrir a aplicação em modo desenvolvimento (com hot reload):

```bash
npm run dev
```

Depois, acesse no navegador: **http://localhost:5173**

### Build para produção

Para gerar a versão otimizada para produção:

```bash
npm run build
```

Os arquivos gerados ficarão na pasta `dist/`.

### Preview do build

Para visualizar o build de produção localmente:

```bash
npm run preview
```

---

## Estrutura do projeto

```
devops-satc/
├── index.html          # Página principal HTML
├── package.json        # Dependências e scripts
├── vite.config.js      # Configuração do Vite
├── src/
│   ├── main.jsx        # Entrada da aplicação React
│   ├── App.jsx         # Componente principal (página Aula DevOps)
│   ├── App.css         # Estilos do App
│   └── index.css       # Estilos globais
└── README.md
```

## Scripts disponíveis

| Comando        | Descrição                          |
|----------------|------------------------------------|
| `npm run dev`  | Sobe o servidor de desenvolvimento |
| `npm run build`| Gera o build de produção           |
| `npm run preview` | Sobe um servidor para testar o build |
