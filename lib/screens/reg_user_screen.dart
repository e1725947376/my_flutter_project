import 'package:flutter/material.dart';

import '../ui/input_decorations.dart';

class RegUserScreen extends StatelessWidget {
  const RegUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Usuario')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '1001011021',
                  labelText: 'Cedula',
                  prefixIcon: Icons.chrome_reader_mode_rounded),
              validator: (value) {},
            ),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Juan Jose',
                  labelText: 'Nombres',
                  prefixIcon: Icons.person_add),
              validator: (value) {},
            ),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Perez Perez',
                  labelText: 'Apellidos',
                  prefixIcon: Icons.person_add),
              validator: (value) {},
            ),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Ecuatoriana',
                  labelText: 'Nacionalidad',
                  prefixIcon: Icons.flag),
              validator: (value) {},
            ),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'juanperez@gmail.com',
                  labelText: 'Correo',
                  prefixIcon: Icons.mail),
              validator: (value) {},
            ),
          ],
        ),
      )),
    );
  }
}
