**EQUIPE**
- AUGUSTO CESAR BONTORIN
- LUCAS EUGÊNIO FLORIANO DE MORAES
- LUIZ GUSTAVO LOPES

________________________________________

**THE JOGO - Protótipo Simplificado**

________________________________________
**1. MaterialApp**

**Descrição**: Widget fundamental que configura a aplicação, definindo o título e a tela inicial.

**Aplicações**: Inicializa o aplicativo "The Jogo" e define `TelaJogo` como sua página principal. É o ponto de partida para a interface do usuário, envolvendo toda a estrutura visual e de navegação.

**Como usar**:

    return MaterialApp(
      title: 'The Jogo',
      home: TelaJogo(),
    );
________________________________________
**2. Scaffold**

**Descrição**: Fornece a estrutura visual básica para a tela do jogo, incluindo uma barra de aplicativo (AppBar) para o título e uma área de conteúdo principal (body) onde os elementos do jogo são dispostos.

**Aplicações**: Utilizado em `TelaJogo` para exibir o título "THE JOGO" na AppBar e organizar o layout interativo do jogo no body. O `Padding` dentro do body ajuda a criar margens para um visual mais agradável.

**Como usar**:

    return Scaffold(
      appBar: AppBar(title: Text('THE JOGO')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Conteúdo do jogo como Text, GridView e ElevatedButton
        ),
      ),
    );
________________________________________
**3. GridView.builder**

**Descrição**: Cria uma grade rolável de itens que são construídos dinamicamente conforme necessário. É ideal para exibir um conjunto de elementos em um layout de grade, especialmente quando o número de itens pode ser grande ou variável.

**Aplicações**: No "The Jogo", é usado para exibir os 20 botões numerados. O jogador interage com esses botões para tentar encontrar o tesouro, evitando a bomba e o monstro. A grade é configurada para ter 4 colunas, com espaçamento entre os botões.

**Como usar**:

    Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Define 4 colunas
          mainAxisSpacing: 8, // Espaçamento vertical
          crossAxisSpacing: 8, // Espaçamento horizontal
        ),
        itemCount: 20, // Total de 20 botões
        itemBuilder: (context, index) {
          return ElevatedButton(
            // Configuração e lógica do botão
          );
        },
      ),
    )
________________________________________
**4. ElevatedButton**

**Descrição**: Um componente de botão material que exibe uma elevação, indicando que é interativo. Responde a eventos de clique para acionar ações.

**Aplicações**: Fundamental no "The Jogo", cada uma das 20 casas da grade é um `ElevatedButton`. Ao ser clicado, revela se o jogador encontrou o tesouro, uma bomba, um monstro ou uma dica. Um `ElevatedButton` adicional é usado para a funcionalidade "NOVO JOGO", permitindo reiniciar a partida.

**Como usar**:

    // Exemplo de botão na grade do jogo
    ElevatedButton(
      onPressed: buttonEnabled[index]
          ? () => _handleButtonPress(index) // Ação ao clicar
          : null, // Desabilitado se buttonEnabled[index] for falso
      child: Text(buttonLabels[index]), // Texto do botão (número, emoji ou dica)
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
    );

    // Exemplo do botão "NOVO JOGO"
    ElevatedButton(
      onPressed: _novoJogo, // Ação para iniciar um novo jogo
      child: Text('NOVO JOGO'),
    );
________________________________________
**5. Lógica do Jogo (StatefulWidget e Métodos)**

**Descrição**: A interatividade e o estado dinâmico do "The Jogo" são gerenciados pela classe `_TelaJogoState`, que herda de `State<TelaJogo>`. Isso permite que a interface do usuário seja reconstruída em resposta a interações ou mudanças de dados. Os métodos principais que controlam a lógica são `_novoJogo()` e `_handleButtonPress(int index)`.

**Aplicações**:
- O método `_novoJogo()` é responsável por inicializar ou reiniciar a partida. Ele sorteia aleatoriamente as posições do tesouro, da bomba e do monstro entre os 20 botões disponíveis. Além disso, redefine a mensagem exibida ao jogador e o estado visual e funcional de todos os botões da grade.
- O método `_handleButtonPress(int index)` é acionado quando o jogador clica em um dos botões da grade. Ele verifica o que está escondido atrás do botão selecionado (tesouro, bomba, monstro ou nada). Com base nisso, atualiza a mensagem principal do jogo (por exemplo, "Você encontrou o Tesouro! 🏆"), altera o rótulo do botão clicado (para um emoji correspondente ou uma interrogação) e habilita/desabilita os botões conforme as regras do jogo. Se o jogador não encontra um item especial, o jogo pode fornecer uma dica sobre a localização do tesouro.

**Como usar (Conceitual - trechos da lógica interna)**:

    // Dentro da classe _TelaJogoState

    void _novoJogo() {
      // Gera números aleatórios para tesouro, bomba, monstro
      // Reseta 'message', 'buttonLabels', 'buttonEnabled'
      // setState(() { ... }); // Atualiza a UI
    }

    void _handleButtonPress(int index) {
      // int chosenNumber = index + 1;
      // if (chosenNumber == tesouro) { ... }
      // else if (chosenNumber == bomba) { ... }
      // else if (chosenNumber == monstro) { ... }
      // else { // Lógica de dica }
      // setState(() { ... }); // Atualiza a UI
    }
