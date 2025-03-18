import 'package:floricultura/components/info_card.dart';
import 'package:flutter/material.dart';

class PedidosScreen extends StatelessWidget {
  PedidosScreen({super.key});

  final List<InfoCard> placeholder = [
    InfoCard(
      titulo: 'Pedido de Flores para Cliente João Silva',
      descricao:
          'Pedido para entrega de flores no endereço Rua das Flores, 123, em 25/03/2025. Arranjo: EncantoTropical, com as flores: lírios, rosas amarelas e orquídeas. Mensagem: Que seu dia seja tão brilhante quanto essas flores!. Preparar e entregarconforme as especificações',
      data: DateTime(2005, 11, 3),
      icon: Icons.abc,
    ),
    InfoCard(titulo: 'C', descricao: 'D', data: DateTime(1999, 1, 2), icon: Icons.ac_unit_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: placeholder.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: InfoCard(
            titulo: placeholder[index].titulo,
            descricao: placeholder[index].descricao,
            data: placeholder[index].data,
            icon: placeholder[index].icon,
          ),
        );
      },
    );
  }
}
