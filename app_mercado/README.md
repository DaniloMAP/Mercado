# Mini Mercado Apepê 

O Mini Mercado Apepê é um projeto Flutter que simula um aplicativo de mercado, permitindo a exibição de uma lista de produtos, filtragem por nome e categoria, e visualização detalhada de cada produto. O projeto utiliza a arquitetura BLoC (Business Logic Component) para gerenciar o estado da aplicação e a comunicação entre os diferentes componentes.

## Estrutura do Projeto

O projeto está estruturado da seguinte forma:

- **lib/**
  - **bloc/**: Contém o código relacionado à lógica de negócios (BLoC) da aplicação.
    - **produto_bloc.dart**: Define o BLoC responsável por gerenciar o estado dos produtos.
  - **models/**: Contém as classes de modelo que representam os dados da aplicação.
    - **produto.dart**: Define a classe `Produto` que representa um produto no mercado.
  - **screens/**: Contém as diferentes telas da aplicação.
    - **home_screen.dart**: Tela principal que exibe a lista de produtos e os filtros.
  - **widgets/**: Contém os componentes reutilizáveis da interface do usuário.
    - **filtro_widget.dart**: Widget que exibe os campos de busca e filtro por categoria.
    - **lista_produtos_widget.dart**: Widget que exibe a lista de produtos.
  - **main.dart**: Arquivo principal que inicializa o aplicativo.

## Funcionalidades

- **Lista de Produtos**: Exibe uma lista de produtos disponíveis.
- **Filtragem por Nome**: Permite filtrar os produtos por nome.
- **Filtragem por Categoria**: Permite filtrar os produtos por categoria.
- **Detalhes do Produto**: Ao tocar em um produto, exibe detalhes como categoria, disponibilidade, referência, etc.

## Arquitetura BLoC

O projeto utiliza a arquitetura BLoC para separar a lógica de negócios da interface do usuário. O `ProdutoBloc` é responsável por gerenciar o estado dos produtos, filtrando e fornecendo os dados necessários para a interface do usuário.

## Como Executar o Projeto

Certifique-se de ter o Flutter instalado em seu ambiente de desenvolvimento. Siga as instruções abaixo:

1. **Configuração do Ambiente:**
   - Certifique-se de ter o Flutter instalado. Se não, siga as instruções em [flutter.dev](https://flutter.dev/docs/get-started/install).

2. **Clone o Repositório:**
   ```bash
   git clone https://seu-repositorio/app_mercado.git
   cd app_mercado
   ```

3. **Execute o Projeto:**
   ```bash
   flutter run
   ```
