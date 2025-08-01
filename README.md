# 💪 Personal Fit - Catálogo de Personais

Aplicativo Flutter desenvolvido para simular a contratação de personal trainers. O projeto permite visualizar profissionais disponíveis, filtrar por especialidades, simular preços e entrar em contato via WhatsApp.

---

## 🚀 Como rodar o projeto

### 🔧 Pré-requisitos

- Flutter SDK (versão recomendada: 3.19.0 ou superior)
- Node.js e npm
- `json-server` para mock da API

### 🔄 Backend (Mock API)

1. Instale o json-server (caso ainda não tenha):
   ```bash
   npm install -g json-server
   ```

2. Execute o servidor mock:
   ```bash
   json-server --watch db.json --port 3000
   ```

> 🔗 O backend ficará disponível em: http://localhost:3000/personals

### ▶️ Frontend (Flutter)

1. Instale as dependências:
   ```bash
   flutter pub get
   ```

2. Execute o app:
   ```bash
   flutter run -d chrome
   ```

> Você também pode rodar em emuladores ou dispositivos físicos Android/iOS.

---

## 🧠 Arquitetura do Projeto

O projeto segue uma **arquitetura em camadas**, separando responsabilidades da seguinte forma:

```
lib/
├── core/
│   └── routes.dart               # Gerenciador de rotas
├── modules/
│   └── personals/
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── personal_remote_datasource.dart
│       │   │   └── personal_remote_datasource_impl.dart
│       │   ├── models/           # Conversão entre JSON e entidades
│       │   └── repositories/     # Implementações concretas dos repositórios
│       ├── domain/
│       │   ├── entities/         # Entidade Personal
│       │   └── repositories/     # Abstrações (interfaces)
│       └── presentation/
│           ├── pages/            # Páginas de UI
│           └── providers/        # Provider com lógica de estado
```

Essa estrutura melhora a **organização**, **manutenção**, **escalabilidade** e a separação entre **camada de dados**, **domínio** e **interface**.

---

## 👨‍💻 Autor

Gabriel Leles Pires Lopes  
📫 [linkedin.com/in/gabriel-leles0](https://www.linkedin.com/in/gabriel-leles0)

---
