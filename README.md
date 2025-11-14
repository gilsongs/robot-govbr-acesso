# 🤖 robot-govbr-acesso

Automação de testes do **Portal gov.br (SSO)** desenvolvida com **Robot Framework** e **SeleniumLibrary**.  
O projeto segue boas práticas de organização, separando recursos, variáveis e resultados para facilitar manutenção e escalabilidade.

---

## 📂 Estrutura do Projeto

```bash
robot-govbr-acesso/
├── tests/        # Casos de teste (.robot)
├── resources/    # Keywords e localizadores de página
├── variables/    # Variáveis e credenciais externas
├── results/      # Logs e relatórios gerados
└── README.md     # Documentação do projeto
```

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
  ```
  
---

## 🧪 Exemplos de Execução de Testes pelo Terminal (Git Bash)

### 🔐 Exemplo — Teste de Login da Conta

	robot -d results \
	  --variable URL_SSO:https://teste.gov.br/login \
	  --variable BROWSER:chrome \
	  --variable CPF:12345678901 \
	  --variable SENHA:Brasil@123 \
	  tests/conta_test.robot

### 🔄 Exemplo — Teste de Recuperação de Conta

	robot -d results \
	  --variable URL_SSO:https://teste.gov.br/login \
	  --variable BROWSER:chrome \
	  --variable CPF:12345678901 \
	  --variable SENHA:Brasil@123 \
	  tests/recupera_conta_test.robot