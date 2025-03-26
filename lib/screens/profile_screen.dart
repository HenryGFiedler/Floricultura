import 'package:auto_size_text/auto_size_text.dart';
import 'package:floricultura/components/main_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final String nome = 'Nome';
  final String email = 'Email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: Offset(0, 5),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 50,
                  children: [
                    Flexible(child: Icon(Icons.abc, size: 100)),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15,
                        children: [
                          AutoSizeText(
                            nome,
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          AutoSizeText(
                            email,
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                spacing: 25,
                children: [
                  MainButton(
                    text: 'Alterar Email',
                    fontSize: 30,
                    height: 60,
                    onPressed:
                        () => {
                          //TODO Alterar Email
                        },
                  ),
                  MainButton(
                    text: 'Alterar Senha',
                    fontSize: 30,
                    height: 60,
                    onPressed:
                        () => {
                          //TODO Alterar Senha
                        },
                  ),
                  MainButton(
                    text: 'Sair',
                    fontSize: 30,
                    height: 60,
                    onPressed:
                        () => {
                          //TODO Sair
                        },
                  ),
                  Spacer(),
                  MainButton(
                    text: 'Excluir Conta',
                    fontSize: 30,
                    height: 60,
                    color: Colors.red.withAlpha(950),
                    onPressed:
                        () => {
                          //TODO Excluir Conta
                        },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
