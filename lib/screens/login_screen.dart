import 'package:floricultura/components/main_button.dart';
import 'package:floricultura/components/text_input_validation.dart';
import 'package:floricultura/screens/cadastro_screen.dart';
import 'package:floricultura/screens/main_screen.dart';
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

  final FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Dar foco automaticamente ao campo de email quando a tela for carregada
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose(); // Dispose do FocusNode quando não for mais necessário
    super.dispose();
  }

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
      backgroundColor: Color(0xB8F87C8A),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
            child: Form(
              autovalidateMode: AutovalidateMode.onUnfocus,
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
                  ),
                  TextInputValidation(
                    controller: emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                  SizedBox(height: 15),
                  TextInputValidation(
                    controller: passwordController,
                    hintText: 'Senha',
                    keyboardType: TextInputType.visiblePassword,
                    validator: _validatePassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 15),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      overlayColor: Colors.transparent,
                    ).copyWith(splashFactory: NoSplash.splashFactory),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                      ),
                    ),
                  ),
                  MainButton(
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        if (emailController.text == 'a@' && passwordController.text == 'b') {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Login feito')));
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Email ou senha incorretos')));
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
      ),
    );
  }
}
