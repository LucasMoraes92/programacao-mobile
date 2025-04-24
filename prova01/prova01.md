
**EQUIPE**
- AUGUSTO CESAR BONTORIN
- LUCAS EUGÊNIO FLORIANO DE MORAES
- LUIZ GUSTAVO LOPES

________________________________________
 **PROTÓTIPO 1 - Catálogo de Viagens** 
________________________________________
**1. MaterialApp**

**Descrição**: Widget raiz que define tema, título e tela inicial.

**Aplicações**: Define o tema do app e o ponto de entrada com CatalogoPage.

**Como usar**:

    return MaterialApp(
      title: 'Catálogo de Viagens',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: CatalogoPage(),
    );
________________________________________
**2. Scaffold**

**Descrição**: Estrutura básica de layout com AppBar, body e outros.

**Aplicações**: Envolve a tela principal do aplicativo e tela de detalhes.

**Como usar**:

    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Viagens'),
      ),
      body: Column(
        children: <Widget>[ (...)

________________________________________
**3. Column**

**Descrição**: Organiza widgets verticalmente.

**Aplicações**: Utilizado para organizar cards de destino e botões.

**Como usar**:

      body: Column(
        children: <Widget>[
          (...)
                  Image.network(
                    (...)          
                    child: Text(
                      (...)
                  Row(
                    (...)

________________________________________
**4. Row**

**Descrição**: Organiza widgets horizontalmente.

**Aplicações**: Alinha os botões de "Ver Detalhes" e "Reservar" lado a lado.

**Como usar**:

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(

________________________________________
**5. ListView.builder**

**Descrição**: Lista de rolagem com renderização sob demanda.

**Aplicações**: Exibe todos os destinos disponíveis em cards.

**Como usar**:

          Expanded(
            child: ListView.builder(
              itemCount: destinos.length,
              itemBuilder: (context, index) {

________________________________________
**6. Navigator.push**

**Descrição**: Navega para outra tela empilhando no histórico.

**Aplicações**: Abre a página de detalhes do destino selecionado.

**Como usar**:


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesPage(

________________________________________
**7. showDialog**

**Descrição**: Mostra uma caixa de diálogo modal.

**Aplicações**: Usado para reservar destinos e confirmar reservas.

**Como usar**:

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(

________________________________________
**8. StatefulBuilder**

**Descrição**: Permite reconstruir parte da UI dentro do showDialog.

**Aplicações**: Atualiza as datas selecionadas dinamicamente dentro do modal.

**Como usar**:

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Center(child: Text('Reserva')),
              content: Column(

________________________________________
**9. showDatePicker**

**Descrição**: Exibe o seletor de datas do Material Design.

**Aplicações**: Seleciona datas de ida e volta na reserva.

**Como usar**:

                        final dataSelecionada = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );

________________________________________
**10. SnackBar**

**Descrição**: Mensagem temporária para feedback.

**Aplicações**: Notifica o usuário quando há erro na seleção de datas.

**Como usar**:

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selecione as datas de ida e volta.'),
                        ),

________________________________________
 **PROTÓTIPO 2 - Calculadora de IMC** 
________________________________________

________________________________________
 **PROTÓTIPO 3 - Perfil de Artista Musical** 
________________________________________

