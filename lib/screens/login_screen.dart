import 'package:floricultura/components/main_button.dart';
import 'package:floricultura/components/text_input_validation.dart';
import 'package:floricultura/screens/cadastro_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Campo de senha vazio';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextInputValidation(
                  controller: emailController,
                  hintText: 'Email',
                  validator: _validateEmail,
                ),
                SizedBox(height: 15),
                TextInputValidation(
                  controller: passwordController,
                  hintText: 'Senha',
                  validator: _validatePassword,
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ).copyWith(splashFactory: NoSplash.splashFactory),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      if (emailController.text == 'a@' &&
                          passwordController.text == 'b') {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Login feito')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Email ou senha incorretos')),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 15),
                MainButton(
                  text: 'Cadastrar',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
