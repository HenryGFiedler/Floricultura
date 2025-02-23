import 'package:flutter/material.dart';
import 'package:floricultura/components/text_input_validation.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Campo do nome vazio';
    }
    return null;
  }

  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Campo do email vazio';
    } else if (!email.contains('@')) {
      return 'Email inválido';
    }
    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Campo de senha vazio';
    } else if (password.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }

  String? _validateConfirmPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Confirme a sua senha';
    } else if (password != passwordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextInputValidation(
                controller: nameController,
                hintText: 'Nome',
                validator: _validateName,
              ),
              SizedBox(height: 15),
              TextInputValidation(
                controller: emailController,
                hintText: 'Email',
                validator: _validateEmail,
              ),
              SizedBox(height: 15),
              TextInputValidation(
                controller: passwordController,
                hintText: 'Senha',
                obscureText: true,
                validator: _validatePassword,
              ),
              SizedBox(height: 15),
              TextInputValidation(
                controller: confirmPasswordController,
                hintText: 'Confirmar senha',
                obscureText: true,
                validator: _validateConfirmPassword,
              ),
              SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Cadastro realizado com sucesso')));
                  }
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
