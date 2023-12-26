// filtro_widget.dart
import 'package:flutter/material.dart';

class FiltroWidget extends StatelessWidget {
  final Function(String) onSearchQueryChanged;

  FiltroWidget({
    required this.onSearchQueryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Buscar por Nome:'),
          TextField(
            onChanged: onSearchQueryChanged,
            decoration: InputDecoration(
              hintText: 'Digite o nome do produto',
            ),
          ),
        ],
      ),
    );
  }
}
