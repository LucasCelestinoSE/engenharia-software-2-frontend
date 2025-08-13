import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:testando/providers/registro_provider.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _dataNascimentoController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  Future<void> _selecionarDataNascimento(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (dataSelecionada != null) {
      final String dataFormatada = DateFormat('dd/MM/yyyy').format(dataSelecionada);
      setState(() {
        _dataNascimentoController.text = dataFormatada;
      });
    }
  }

  // Limpa campos do formulário
  void _clearFormFields() {
    _nomeController.clear();
    _emailController.clear();
    _dataNascimentoController.clear();
    _senhaController.clear();
    _confirmarSenhaController.clear();
  }

 void _onRegisterPressed() async {
  if (_formKey.currentState!.validate()) {
    final provider = Provider.of<RegistrationProvider>(context, listen: false);

    print('Status do Provider antes do registro: ${provider.status}');
    
    try {
      await provider.registerUser(
        name: _nomeController.text,
        email: _emailController.text,
        birthDate: _dataNascimentoController.text,
        password: _senhaController.text,
      );

      print('Status do Provider após o registro: ${provider.status}');

      if (provider.status == RegistrationStatus.success) {
        _clearFormFields();
      } else {
        print('A condição de sucesso não foi atendida. Status atual: ${provider.status}');
      }
    } catch (e) {
      print('Ocorreu um erro no bloco try-catch: $e');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 217, 203),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromARGB(255, 223, 217, 203),
      ),
      body: Consumer<RegistrationProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Registro', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0))),
                    const SizedBox(height: 32),
                    _buildTextField(controller: _nomeController, 
                      labelText: 'Nome', 
                      validator: (value) { 
                        if (value == null || value.isEmpty) { 
                          return 'Por favor, insira seu nome'; }
                        return null; }),
                    const SizedBox(height: 16),
                    _buildTextField(controller: _emailController,
                      labelText: 'E-mail', 
                      keyboardType: TextInputType.emailAddress, 
                      validator: (value) { 
                        if (value == null || value.isEmpty || !value.contains('@')) { 
                          return 'Por favor, insira um e-mail válido'; } 
                        return null; }),
                      const SizedBox(height: 16),
                      _buildDateField(controller: _dataNascimentoController, 
                      labelText: 'Data Nascimento',),
                    const SizedBox(height: 16),
                    _buildTextField(controller: _senhaController, 
                      labelText: 'Senha', 
                      obscureText: true, 
                      validator: (value) { 
                        if (value == null || value.isEmpty || value.length < 6) { 
                          return 'A senha deve ter no mínimo 6 caracteres'; } 
                        return null; }),
                    const SizedBox(height: 16),
                    _buildTextField(controller: _confirmarSenhaController,
                      labelText: 'Confirmar senha',
                      obscureText: true, 
                      validator: (value) {
                        if (value == null || value.isEmpty || value != _senhaController.text) { 
                          return 'As senhas não coincidem'; } 
                        return null; }),
                    const SizedBox(height: 32),
                    if (provider.status == RegistrationStatus.loading)
                      const Center(child: CircularProgressIndicator()),
                    
                    if (provider.status != RegistrationStatus.loading)
                      ElevatedButton(
                        onPressed: _onRegisterPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 94, 189, 237),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Registrar', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold,)),
                      ),
                    
                    if (provider.status == RegistrationStatus.error)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'Erro: ${provider.errorMessage}',
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Métodos _buildTextField e _buildDateField
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        fillColor: const Color.fromARGB(255, 148, 139, 128),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }

  Widget _buildDateField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () => _selecionarDataNascimento(context),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        fillColor: const Color.fromARGB(255, 148, 139, 128),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: const Icon(Icons.calendar_today, color: Colors.black),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, selecione sua data de nascimento';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _dataNascimentoController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }
}