import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/features/profile/profile_screen.dart';
import 'package:testando/features/register/register_provider.dart';
import 'package:testando/widgets/rounded_button.dart';

class RegisterScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final registerProvider = context.watch<RegisterProvider>();
    final _birthDateController = TextEditingController();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          // Alinha os itens no topo da tela em vez do centro.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Registro",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
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
            const SizedBox(height: 44),
            RoundedButton(
              isLoading: registerProvider.isLoading,
              onPressed: () => registerProvider.register(),
              text: 'Registrar',
            ),
            
          ],
        ),
      );
  }
  
}