# 🖥️ Projeto de Automação - Kabum

Este projeto foi desenvolvido em **Robot Framework** com **SeleniumLibrary** para automatizar cenários de teste no site [Kabum](https://www.kabum.com.br).
O objetivo é praticar **boas práticas de automação web**, incluindo espera explícita, preenchimento de campos, rolagem até elementos e captura de falhas.

---

## 📋 Pré-requisitos

Antes de executar, você precisa ter instalado:

- [Python 3.8+](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/installation/)
- [Google Chrome](https://www.google.com/chrome/) ou outro navegador
- [ChromeDriver](https://chromedriver.chromium.org/downloads) compatível com sua versão do Chrome

---

## 📦 Instalação

Clone o repositório e instale as dependências:

```bash
git clone https://github.com/seu-usuario/desafio-1-kabum.git
cd desafio-1-kabum

pip install -r requirements.txt

robotframework
robotframework-seleniumlibrary
robot -d ./results ./test/

desafio-1-kabum/
│
├── resource                   # Keywords e variáveis reutilizáveis
│   ├── ContextoSteps.robot
│
├── tests/                  # Suites de testes
│   └── test.robot          # Casos de teste Kabum
│
├── results/                # Relatórios e logs gerados
│
├── requirements.txt        # Dependências do projeto
└── README.md               # Documentação do projeto
├── .gitignore

