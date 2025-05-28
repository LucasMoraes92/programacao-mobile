**EQUIPE**
- AUGUSTO CESAR BONTORIN
- LUCAS EUGÊNIO FLORIANO DE MORAES
- LUIZ GUSTAVO LOPES

________________________________________
**PETAPP**
________________________________________
**1. MaterialApp**
**Descrição**: Widget principal da aplicação que configura o tema, título e define a tela inicial (PerfilPetScreen).

**Aplicações**: Inicia o app com PetApp, definindo uma paleta de cores com colorSchemeSeed e ativando recursos do Material 3.

**Como usar**:
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

________________________________________
**2. Scaffold**
**Descrição**: Fornece a estrutura visual principal, incluindo AppBar e área de conteúdo.

**Aplicações**: Envolve o formulário de cadastro de pets com uma AppBar (com ícone de perfil) e um corpo rolável com campos de entrada e seleções.

**Como usar**:
return Scaffold(
  appBar: AppBar(
    title: const Text('Perfil do Pet'),
    actions: [
      IconButton(
        icon: const Icon(Icons.account_circle),
        tooltip: 'Perfil do Usuário',
        onPressed: () { ... },
      ),
    ],
  ),
  body: SingleChildScrollView(
    padding: EdgeInsets.only(...),
    child: Form(...),
  ),
);

________________________________________
**3. Form e TextFormField**

**Descrição**: Form permite validação de múltiplos campos de entrada. TextFormField coleta dados textuais como nome, raça e idade do pet.

**Aplicações**: Cada campo possui validação e feedback visual. O formulário é validado antes do salvamento.

**Como usar**:

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        controller: nomeController,
        decoration: InputDecoration(...),
        validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
      ),
      ...
    ],
  ),
);

________________________________________
**4. RadioListTile**

**Descrição**: Componente que permite seleção única entre opções. Usado aqui para escolher o gênero do pet.

**Aplicações**: Exibe as opções "Macho" e "Fêmea". Atualiza _generoSelecionado no estado da tela.

**Como usar**:

RadioListTile<PetGenero>(
  title: const Text('Macho'),
  value: PetGenero.macho,
  groupValue: _generoSelecionado,
  onChanged: (PetGenero? value) {
    setState(() {
      _generoSelecionado = value;
    });
  },
);

________________________________________
**5. CheckboxListTile e SwitchListTile**

**Descrição**: Permitem marcar preferências de convivência e disponibilidade para adoção com interação simples.

**Aplicações**:

**CheckboxListTile**: Marca se o pet gosta de crianças ou se convive bem com outros animais.

**SwitchListTile**: Controla a disponibilidade para adoção.

**Como usar**:

CheckboxListTile(
  title: const Text('Gosta de crianças'),
  value: _gostaCriancas,
  onChanged: (bool? valor) {
    setState(() {
      _gostaCriancas = valor ?? false;
    });
  },
);

SwitchListTile(
  title: const Text('Disponível para adoção'),
  value: _disponivelParaAdocao,
  onChanged: (bool valor) {
    setState(() {
      _disponivelParaAdocao = valor;
    });
  },
);

________________________________________
**6. Métodos e Estado do Formulário**

**Descrição**: A classe _PerfilPetScreenState é responsável por manter os dados dos campos e o estado da interface. Dois métodos principais controlam o comportamento: _salvarCadastro() e _limparCampos().

**Aplicações**:

_salvarCadastro(): Valida o formulário e mostra uma mensagem com SnackBar ao salvar.

_limparCampos(): Reseta os campos do formulário e estados dos controles.

**Como usar**:

void _salvarCadastro() {
  if (_formKey.currentState!.validate()) {
    // Processa os dados
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dados salvos com sucesso!')),
    );
  }
}

void _limparCampos() {
  _formKey.currentState?.reset();
  // Limpa os TextEditingControllers e estado
}
