
**EQUIPE**
- AUGUSTO CESAR BONTORIN
- LUCAS EUGÊNIO FLORIANO DE MORAES
- LUIZ GUSTAVO LOPES

 **PROTÓTIPO 1 - Catálogo de Viagens** 
________________________________________
**1. MaterialApp**
**Descrição**: Widget raiz que define tema, título e tela inicial.
**Aplicações**: Define o tema do app e o ponto de entrada com CatalogoPage.
**Como usar**:
MaterialApp(
  title: 'Catálogo de Viagens',
  theme: ThemeData(...),
  home: CatalogoPage(),
)
**2. Scaffold**
Descrição: Estrutura básica de layout com AppBar, body e outros.
Aplicações: Envolve a tela principal do aplicativo e tela de detalhes.
Como usar:
Scaffold(
  appBar: AppBar(...),
  body: Column(...),
)
**3. Column**
Descrição: Organiza widgets verticalmente.
Aplicações: Utilizado para organizar cards de destino e botões.
Como usar:
Column(
  children: [Image.network(...), Text(...), Row(...)],
)
**4. Row**
Descrição: Organiza widgets horizontalmente.
Aplicações: Alinha os botões de "Ver Detalhes" e "Reservar" lado a lado.
Como usar:
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [ElevatedButton(...), ElevatedButton(...)],
)
**5. ListView.builder**
Descrição: Lista de rolagem com renderização sob demanda.
Aplicações: Exibe todos os destinos disponíveis em cards.
Como usar:
ListView.builder(
  itemCount: destinos.length,
  itemBuilder: (context, index) => Card(...),
)
**6. Navigator.push**
Descrição: Navega para outra tela empilhando no histórico.
Aplicações: Abre a página de detalhes do destino selecionado.
Como usar:
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetalhesPage(...)),
)
**7. showDialog**
Descrição: Mostra uma caixa de diálogo modal.
Aplicações: Usado para reservar destinos e confirmar reservas.
Como usar:
showDialog(
  context: context,
  builder: (context) => AlertDialog(...),
)
**8. StatefulBuilder**
Descrição: Permite reconstruir parte da UI dentro do showDialog.
Aplicações: Atualiza as datas selecionadas dinamicamente dentro do modal.
Como usar:
StatefulBuilder(
  builder: (context, setState) => Column(...),
)
**9. showDatePicker**
Descrição: Exibe o seletor de datas do Material Design.
Aplicações: Seleciona datas de ida e volta na reserva.
Como usar:
final data = await showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime.now(),
  lastDate: DateTime.now().add(Duration(days: 365)),
);
**10. SnackBar**
Descrição: Mensagem temporária para feedback.
Aplicações: Notifica o usuário quando há erro na seleção de datas.
Como usar:
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('...')),
)

