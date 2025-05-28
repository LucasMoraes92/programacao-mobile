import 'package:flutter/material.dart';
 
void main() {
  runApp(const PetApp());
}
 
enum PetGenero { macho, femea }
 
class PetApp extends StatelessWidget {
  const PetApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetApp',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const PerfilPetScreen(),
    );
  }
}
 
class PerfilPetScreen extends StatefulWidget {
  const PerfilPetScreen({super.key});
 
  @override
  State<PerfilPetScreen> createState() => _PerfilPetScreenState();
}
 
class _PerfilPetScreenState extends State<PerfilPetScreen> {
  final _formKey = GlobalKey<FormState>();
 
  final nomeController = TextEditingController();
  final racaController = TextEditingController();
  final idadeController = TextEditingController();
  final observacoesController = TextEditingController();
 
  PetGenero? _generoSelecionado;
  bool _gostaCriancas = false;
  bool _conviveOutrosAnimais = false;
  bool _disponivelParaAdocao = false;
 
  void _limparCampos() {
    _formKey.currentState?.reset();
    nomeController.clear();
    racaController.clear();
    idadeController.clear();
    observacoesController.clear();
    setState(() {
      _generoSelecionado = null;
      _gostaCriancas = false;
      _conviveOutrosAnimais = false;
      _disponivelParaAdocao = false;
    });
  }
 
  void _salvarCadastro() {
    if (_formKey.currentState!.validate()) {
      final nome = nomeController.text;
      final raca = racaController.text;
      final idade = idadeController.text;
      final observacoes = observacoesController.text;
 
print('Nome: $nome, Raça: $raca, Idade: $idade, Observações: $observacoes');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dados salvos com sucesso!')),
      );
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Pet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Perfil do Usuário',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Perfil do usuário clicado.')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cadastro de Perfil do Pet',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Pet',
                  prefixIcon: Icon(Icons.pets),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome do pet';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: racaController,
                decoration: const InputDecoration(
                  labelText: 'Raça',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a raça do pet';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: idadeController,
                decoration: const InputDecoration(
                  labelText: 'Idade (em anos)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final idade = int.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return 'Informe a idade do pet';
                  } else if (idade == null || idade < 0) {
                    return 'Idade inválida';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: observacoesController,
                decoration: const InputDecoration(
                  labelText: 'Observações (opcional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              const Text('Gênero do Pet'),
              RadioListTile<PetGenero>(
                title: const Text('Macho'),
                value: PetGenero.macho,
                groupValue: _generoSelecionado,
                onChanged: (PetGenero? value) {
                  setState(() {
                    _generoSelecionado = value;
                  });
                },
              ),
              RadioListTile<PetGenero>(
                title: const Text('Fêmea'),
                value: PetGenero.femea,
                groupValue: _generoSelecionado,
                onChanged: (PetGenero? value) {
                  setState(() {
                    _generoSelecionado = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text('Preferências de Convivência'),
              CheckboxListTile(
                title: const Text('Gosta de crianças'),
                value: _gostaCriancas,
                onChanged: (bool? valor) {
                  setState(() {
                    _gostaCriancas = valor ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Convive bem com outros animais'),
                value: _conviveOutrosAnimais,
                onChanged: (bool? valor) {
                  setState(() {
                    _conviveOutrosAnimais = valor ?? false;
                  });
                },
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Disponível para adoção'),
                value: _disponivelParaAdocao,
                onChanged: (bool valor) {
                  setState(() {
                    _disponivelParaAdocao = valor;
                  });
                },
              ),
              Text(
                'Status: ${_disponivelParaAdocao ? 'Disponível' : 'Indisponível'}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _salvarCadastro,
                    child: const Text('Salvar'),
                  ),
                  OutlinedButton(
                    onPressed: _limparCampos,
                    child: const Text('Limpar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
