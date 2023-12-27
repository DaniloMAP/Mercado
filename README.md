# Mini Mercado Apepê

Bem-vindo ao projeto Mini Mercado Apepê! Este é um aplicativo Flutter que simula um mini mercado, permitindo aos usuários explorar uma lista de produtos, filtrá-los por nome e categoria, e visualizar detalhes sobre cada produto.

## Estrutura do Projeto

O projeto está organizado da seguinte maneira:

- **mercado_app_v2**: Diretório principal do projeto.
  - **assets**: Armazena ativos estáticos, como imagens.
    - **images**: Diretório de imagens.
  - **lib**: Contém o código-fonte principal do aplicativo.
    - **models**: Armazena a definição da classe `Produto` que representa um produto no aplicativo.
      - **produto.dart**: Contém a definição da classe `Produto`.
    - **screens**: Contém as telas principais do aplicativo.
      - **home_screen.dart**: Implementa a tela inicial do aplicativo, que exibe a lista de produtos.
    - **widgets**: Inclui widgets reutilizáveis utilizados nas telas.
      - **filtro_widget.dart**: Implementa um widget para filtrar produtos por nome e categoria.
      - **lista_produtos_widget.dart**: Implementa um widget para exibir a lista de produtos.

## Arquivos Principais

- **main.dart**: Arquivo principal responsável pela inicialização do aplicativo. Ele define a classe `MyApp`, que configura a estrutura básica do aplicativo.

- **produto.dart**: Define a classe `Produto`, que representa um produto no aplicativo. A classe possui atributos como `id`, `nome`, `categoria`, etc., e métodos para serialização/deserialização a partir de JSON.

- **home_screen.dart**: Implementa a tela inicial do aplicativo (`HomeScreen`), que exibe a lista de produtos e fornece opções de filtragem.

- **filtro_widget.dart**: Oferece um widget reutilizável para filtrar produtos por nome e categoria.

- **lista_produtos_widget.dart**: Implementa um widget para exibir a lista de produtos. Cada item é clicável, permitindo a visualização de detalhes.

## Fluxo de Funcionamento

1. Ao iniciar o aplicativo, a tela inicial (`HomeScreen`) é exibida.
2. O usuário pode filtrar os produtos digitando um nome na caixa de pesquisa ou selecionando uma categoria no menu suspenso.
3. A lista de produtos é atualizada conforme os filtros aplicados.
4. Os produtos são exibidos em cards clicáveis, permitindo que o usuário visualize detalhes adicionais.

## Como Executar o Projeto

Certifique-se de ter o Flutter instalado em seu ambiente de desenvolvimento. Siga as instruções abaixo:

1. **Configuração do Ambiente:**
   - Certifique-se de ter o Flutter instalado. Se não, siga as instruções em [flutter.dev](https://flutter.dev/docs/get-started/install).

2. **Clone o Repositório:**
   ```bash
   git clone https://seu-repositorio/mini_mercado_apepe.git
   cd mini_mercado_apepe
   ```

3. **Execute o Projeto:**
   ```bash
   flutter run
   ```

4. **Observações Importantes:**
   - Certifique-se de ter um dispositivo conectado ou um emulador disponível.
