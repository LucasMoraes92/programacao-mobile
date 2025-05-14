import 'dart:math';
import 'package:flutter/material.dart';
 
void main() => runApp(TheJogo());
 
class TheJogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Jogo',
      home: TelaJogo(),
    );
  }
}
 
class TelaJogo extends StatefulWidget {
  @override
  _TelaJogoState createState() => _TelaJogoState();
}
 
class _TelaJogoState extends State<TelaJogo> { //armazenar o número que está o tesouro, bomba e monstro
  int tesouro = -1;
  int bomba = -1;
  int monstro = -1;
  String message = 'Encontre o Tesouro!';
  List<String> buttonLabels = List.generate(20, (index) => '${index + 1}'); //botões de 1 a 20
  List<bool> buttonEnabled = List.generate(20, (index) => true); //botão habilitado ou não.
 
  void _novoJogo() { //método - iniciar jogo
    setState(() {
      Random random = Random(); //Gerar números aleatórios
      List<int> numbers = List.generate(20, (index) => index + 1)..shuffle(random);
      //atribui números aleatórios aos elementos
      tesouro = numbers[0];
      bomba = numbers[1];
      monstro = numbers[2];
 
      message = 'Encontre o Tesouro!';
      buttonLabels = List.generate(20, (index) => '${index + 1}'); 
      buttonEnabled = List.generate(20, (index) => true); 
    });
  }
 
      //método para funcionar o clique do botão
  void _handleButtonPress(int index) {
    setState(() {
      int chosenNumber = index + 1; //número que representa o botão clicado
      if (chosenNumber == tesouro) { //cada if representa o elemento, desabilita o botão ou indica se encontrou algum dos elementos
        message = 'Você encontrou o Tesouro! 🏆';
        buttonLabels[index] = '🏆';
        buttonEnabled = List.generate(20, (_) => false);
        buttonEnabled[index] = true;
      } else if (chosenNumber == bomba) {
        message = 'Você encontrou a Bomba! 💣 Game Over!';
        buttonLabels[index] = '💣';
        buttonEnabled = List.generate(20, (_) => false);
        buttonEnabled[index] = true;
      } else if (chosenNumber == monstro) {
        message = 'Você encontrou o Monstro! 👾 Game Over!';
        buttonLabels[index] = '👾';
        buttonEnabled = List.generate(20, (_) => false);
        buttonEnabled[index] = true;
      } else {
        if (chosenNumber < tesouro) { //indica se o tesouro é um número maior ou menor
          message = 'Dica: O tesouro está em um número maior!';
        } else {
          message = 'Dica: O tesouro está em um número menor!';
        }
        buttonLabels[index] = '❔';
        buttonEnabled[index] = false;
      }
    });
  }
 
  @override
  void initState() {
    super.initState();
    _novoJogo();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('THE JOGO')), //cabeçalho
      body: Padding(
        padding: const EdgeInsets.all(16.0), //margem ao redor da tela
        child: Column(
          children: [ //mensagem atual do jogo
            Text(
              message,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded( //fazer a grande de botões de 5 linhas x 4 colunas
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,//espaçamento vertical
                  crossAxisSpacing: 8, //espaçamento horizontal 
                ),
                itemCount: 20, //tendo 20 botões
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: buttonEnabled[index]
                        ? () => _handleButtonPress(index) //chama o método, caso não tenha nada
                        : null, //desabilita se falso
                    child: Text(
                      buttonLabels[index], //texto nos quadrados
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, //cor do fundo
                      foregroundColor: Colors.white, //cor do texto
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), //tipo do botão (no caso, quadrado)
                      ),
                      minimumSize: Size(40, 40), //tamanho do botão
                      padding: EdgeInsets.all(0),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton( //novo Jogo
              onPressed: _novoJogo,
              child: Text('NOVO JOGO'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
