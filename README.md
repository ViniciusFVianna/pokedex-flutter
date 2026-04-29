# Pokedex Flutter 🎮

Uma aplicação mobile moderna e fluida desenvolvida em Flutter para explorar o universo Pokémon. O projeto consome a [PokéAPI](https://pokeapi.co/) e foca em uma experiência de usuário rica, com animações e um design limpo.

## 📌 Sobre o Projeto

Este projeto foi desenvolvido para aplicar conceitos avançados de **UI/UX Design** e consumo de APIs REST no ecossistema Flutter. A aplicação permite navegar por uma lista de Pokémons, visualizar detalhes técnicos, tipos, habilidades e estatísticas base.

## ✨ Funcionalidades

- [x] Listagem infinita de Pokémons (Pagination).
- [x] Busca por nome ou ID.
- [x] Detalhes completos (Status, Tipos, Peso, Altura).
- [x] Paleta de cores dinâmica baseada no tipo do Pokémon.
- [ ] Evoluções e formas alternativas (Em desenvolvimento).

## 🛠️ Tecnologias e Ferramentas

- **Linguagem:** Dart
- **Framework:** [Flutter](https://flutter.dev/)
- **Gerenciamento de Estado:** (Ex: Bloc / Provider / Signals - *ajuste conforme seu uso*)
- **Consumo de API:** [Dio](https://pub.dev/packages/dio) ou [Http]
- **Design:** Inspirado em Material Design 3 e prototipado no Figma.

## 🏗️ Arquitetura e Boas Práticas

O projeto segue uma estrutura organizada para facilitar a escalabilidade:
- **Models:** Mapeamento dos dados JSON da PokéAPI.
- **Repositories:** Camada de abstração para as requisições de rede.
- **Components/Widgets:** UI modular e reutilizável.
- **Themes:** Gerenciamento centralizado de cores e tipografia.

## ⚙️ Como executar

### Pré-requisitos
- Flutter SDK instalado na versão estável.
- Emulador Android/iOS ou dispositivo físico conectado.

### Instalação

1. Clone o repositório:
   ```bash
   git clone [https://github.com/ViniciusFVianna/pokedex-flutter.git](https://github.com/ViniciusFVianna/pokedex-flutter.git)
