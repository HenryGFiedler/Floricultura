import 'package:floricultura/components/main_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final String titulo;
  final String descricao;
  final DateTime data;
  final IconData
  icon; // TODO imagem do widget se for necessário, se não pode ser um ícone opcional.

  const InfoCard({
    super.key,
    this.titulo = '',
    this.descricao = '',
    required this.data,
    required this.icon,
  });

  void showFullScreen(
    BuildContext context,
    String titulo,
    String descricao,
    DateTime data,
    IconData icon,
  ) {
    // TODO Fazer com que o layout não exploda depois de aumentar a fonte do emulador
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0xFFFFEFFC),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          insetPadding: EdgeInsets.all(0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.9,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              minHeight: MediaQuery.of(context).size.height * 0.7,
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFffd9f8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1640625,
                              width: MediaQuery.of(context).size.height * 0.1640625,
                              child: Icon(icon, size: 100),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1640625,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, left: 5),
                                    child: Text(
                                      titulo,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      textScaler: TextScaler.noScaling,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Text(
                                        DateFormat('dd/MM/yyyy').format(data),
                                        style: TextStyle(fontSize: 25),
                                        textScaler: TextScaler.noScaling,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 30),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.30,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                descricao,
                                style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainButton(
                              text: 'Concluir',
                              color: Color(0xFF99f59a),
                              fontSize: 20,
                              adaptiveWidth: true,
                              onPressed:
                                  () => {
                                    // TODO Concluir pedido
                                  },
                            ),
                            MainButton(
                              text: 'Editar',
                              color: Color(0xFFffcc74),
                              fontSize: 20,
                              adaptiveWidth: true,
                              onPressed:
                                  () => {
                                    // TODO Editar pedido
                                  },
                            ),
                            MainButton(
                              adaptiveWidth: true,
                              icon: Icons.delete,
                              color: Color(0xFFff4f53),
                              onPressed:
                                  () => {
                                    // TODO Excluír pedido
                                  },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showFullScreen(context, titulo, descricao, data, icon),
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFFFEFFC),
              borderRadius: BorderRadius.all(Radius.circular(12)),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100, width: 100, child: Icon(icon, size: 70)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 5),
                          child: Text(
                            titulo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            descricao,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          DateFormat('dd/MM').format(data),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
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
