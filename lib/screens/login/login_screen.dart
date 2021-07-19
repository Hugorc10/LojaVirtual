import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/users.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black,
    // backgroundColor: Colors.black,,
    padding: EdgeInsets.all(0)
  );

  final GlobalKey<ScaffoldState> scalffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scalffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, child) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if(!emailValid(email!)) {
                          return 'E-mail invalido';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: passwordController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      obscureText: true,
                      validator: (password) {
                        if(password!.isEmpty || password.length < 5) {
                          return 'Senha invalida';
                        }
                        return null;
                      },
                    ),
                    child,
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: userManager.loading ? null : () {
                          if(formKey.currentState!.validate()) {
                            userManager.signIn(
                                users: Users(
                                    email: emailController.text,
                                    password: passwordController.text
                                ), onFail: (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Falha ao entrar: $e'),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                  )
                              );
                            },
                            onSuccess: () {
                              // TODO: FECHAR TELA DE LOGIN
                            }
                            );
                          }
                        },
                        style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if(states.contains(MaterialState.pressed)) {
                                return Theme.of(context)
                                    .primaryColor;
                              } else if(states.contains(MaterialState.disabled)) {
                                return Theme.of(context)
                                    .primaryColor
                                    .withAlpha(100);
                              }
                              return Theme.of(context).primaryColor;
                            },
                          ),
                        ),
                        child: userManager.loading ?
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ) :
                        const Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: flatButtonStyle,
                  onPressed: () {

                  },
                  child: const Text(
                      'Esqueci minha senha'
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}