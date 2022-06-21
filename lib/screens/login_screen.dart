import 'package:flutter/material.dart';

import 'package:fl_voy_app/widgets/widgets.dart';


class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
           child: Column(
            children:  [
              const SizedBox(height: 100),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Login',style: Theme.of(context).textTheme.headline4),
                    const SizedBox(height: 30),
                    _LoginForm(),


                ],
                ),
                
              ),
              const SizedBox(height:50),
              const Text('Registrar nueva cuenta',style: TextStyle(fontSize: 18))
            ],
           ),
        )
      )
      );
     
    
  }
}

class _LoginForm extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO: REFERENCIA KEY
      child: Form(
        child: Column(
        
        children: [
          TextFormField()




        ]),
    ),
    );
  }
}