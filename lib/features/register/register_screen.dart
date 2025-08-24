import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:testando/features/profile/profile_screen.dart';
import 'package:testando/features/register/register_provider.dart';
import 'package:testando/widgets/rounded_button.dart';
import 'package:testando/features/static/termoDeUso.dart'; 


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
   bool _aceitouTermos = false;

  @override
  Widget build(BuildContext context) {
    final registerProvider = context.watch<RegisterProvider>();
    final _birthDateController = TextEditingController();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Registro",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              onChanged: (value) => registerProvider.name = value,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                
                filled: true,
                fillColor: Color(0xFF948B80),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15)),
              ),
            ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => registerProvider.email = value,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Color(0xFF948B80),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                ),
              ),
               const SizedBox(height: 20),
              TextField(
                controller: _birthDateController
                  ..text = registerProvider.dateOfBirth ?? '',
                onChanged: (value) => registerProvider.dateOfBirth = value,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    registerProvider.setDateOfBirth(date.toIso8601String().substring(0, 10));
                  }
                },
                
                decoration: InputDecoration(
                  labelText: "Data Nascimento",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Color(0xFF948B80),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                ),
              ),
               const SizedBox(height: 20),
              TextField(
                onChanged: (value) => registerProvider.password = value,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Color(0xFF948B80),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                ),
              ),
               const SizedBox(height: 20),
              TextField(
                onChanged: (value) => registerProvider.confirmPassword = value,
                decoration: InputDecoration(
                  labelText: "Confirmação de Senha",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Color(0xFF948B80),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                ),
              ),
            
            const SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: _aceitouTermos,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _aceitouTermos = newValue ?? false;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        const TextSpan(text: 'Eu li e concordo com os '),
                        TextSpan(
                          text: 'Termos de Uso',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            decoration: TextDecoration.underline,
                          ),
                          // Ação de clique para abrir a tela de termos
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TermosDeUsoScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),  
            const SizedBox(height: 44),
            RoundedButton(
              isLoading: registerProvider.isLoading,
              onPressed: _aceitouTermos ? () => registerProvider.register() : null,
              text: 'Registrar',
            ),
          ],
        ),
      );
  }
  
}