import 'package:flutter/material.dart';

class FiltroWidget extends StatelessWidget {
  final void Function(String) onSearchQueryChanged;
  final void Function(String?) onCategoryFilterChanged;

  FiltroWidget({
    required this.onSearchQueryChanged,
    required this.onCategoryFilterChanged,
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
          SizedBox(height: 16.0),
          Text('Filtrar por Categoria:'),
          DropdownButton<String>(
            onChanged: (String? value) =>
                onCategoryFilterChanged(value),
            hint: Text('Selecione uma categoria'),
            items: [
              'Todos',
              'Iogurtes',
              'Bebidas',
              'Snacks',
              'Biscoitos',
              'Bolachas',
              'Chocolates',
              'Cafés',
            ].map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
