import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final String titulo;
  final String descricao;
  final DateTime data;
  final IconData icon; // TODO imagem do widget se for necessário, se não pode ser um ícone opcional

  const InfoCard({
    super.key,
    this.titulo = '',
    this.descricao = '',
    required this.data,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFFFEFFC),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
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
                SizedBox(height: 100, width: 100, child: Icon(icon, size: 70,)),
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
                        child: Text(descricao,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
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
    );
  }
}
