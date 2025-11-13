# 🤖 robot-govbr-acesso

Automação de testes do **Portal gov.br (SSO)** desenvolvida com **Robot Framework** e **SeleniumLibrary**.  
O projeto segue boas práticas de organização, separando recursos, variáveis e resultados para facilitar manutenção e escalabilidade.

---

## 📂 Estrutura do Projeto

robot-govbr-acesso/
├── tests/ # Casos de teste (.robot)
├── resources/ # Keywords e localizadores de página
├── variables/ # Variáveis e credenciais externas
├── results/ # Logs e relatórios gerados
└── README.md # Documentação do projeto

---

## ⚙️ Pré-requisitos

- Python 3.9+  
- Google Chrome  
- ChromeDriver compatível  
- Pacotes:
  ```bash
  pip install robotframework
  pip install robotframework-seleniumlibrary
  pip install webdriver-manager
