import 'package:fl_voy_app/providers/login_form_provider.dart';
import 'package:fl_voy_app/router/app_routes.dart';
import 'package:fl_voy_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:fl_voy_app/ui/input_decorations.dart';
import 'package:provider/provider.dart';

import 'package:fl_voy_app/widgets/widgets.dart';

import '../services/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text('Login', style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 30),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'register'),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.deepPurple.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: const Text('Registrar nueva cuenta',
                    style: TextStyle(fontSize: 18, color: Colors.black87)))
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Ingrese correo',
                  labelText: 'Correo',
                  prefixIcon: Icons.alternate_email_sharp),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no es un correo';
              },
            ),
            const SizedBox(height: 5),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Ingrese contrase??a',
                  labelText: 'Contrase??a',
                  prefixIcon: Icons.lock_outline),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contrase??a debe ser de 6 caracteres';
              },
            ),
            const SizedBox(height: 5),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere...' : 'Ingresar',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        if (!loginForm.isValidForm()) return;
                        loginForm.isLoading = true;

                        final String? errorMessage = await authService.login(
                            loginForm.email, loginForm.password);

                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, 'home');
                        } else {
                          print(errorMessage);

                          NotificationsService.showSnackbar(errorMessage);
                          loginForm.isLoading = false;
                        }
                      })
          ],
        ),
      ),
    );
  }
}
