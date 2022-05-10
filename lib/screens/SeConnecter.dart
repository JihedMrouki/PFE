// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mealbox/screens/inscription/inscription.dart';

class SeConnecter extends StatefulWidget {
  const SeConnecter({Key? key}) : super(key: key);

  @override
  State<SeConnecter> createState() => _SeConnecterState();
}

class _SeConnecterState extends State<SeConnecter> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("entrez votre email");
        }
        if (!RegExp("^[a-zA-Z0-9+_,-]+@[a-zA-Z0-9+_,-]+.[a-z]")
            .hasMatch(value)) {
          return ("entrez une adresse email valide");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            )),
        prefixIcon: const Icon(Icons.mail),
        //hintText: 'Email / Téléphone',
        filled: true,
        labelText: "Email / Téléphone",
      ),
    );
    //password
    final passwordlField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Entrez une mot de passe");
        }
        if (!regex.hasMatch(value)) {
          return ("Entrez une mot de passe valide");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            )),
        prefixIcon: const Icon(Icons.vpn_key),
        //hintText: 'mot de passe',
        filled: true,
        labelText: "Mot de passe",
      ),
    );
    //ButtonLogin
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xFF93C572),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          // login(emailController.text, passwordController.text);
        },
        child: const Text(
          "Connection",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        child: Text(
                          "Se Connecter",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                          ),
                        ),
                      ),
                      const SizedBox(
                        child: Text(
                          "POUR CONTINUER",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      emailField,
                      const SizedBox(height: 25),
                      passwordlField,
                      const SizedBox(height: 35),
                      loginButton,
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Un trou de mémoire ? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => inscription()));
                            },
                            child: const Text("S'inscire",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
