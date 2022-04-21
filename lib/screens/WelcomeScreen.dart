// ignore: file_names
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'SeConnecter.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 375,
                child: Image.asset('assets/images/welcomeimage.png')),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Une formule de votre meal\n préféré livrée au bureau',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(43, 0, 43, 40),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  filled: true,
                  labelText: "Entrez le nom de votre entreprise",
                ),
              ),
            ),
            Column(
              children: <Widget>[
                // the login button
                Padding(
                  padding: EdgeInsets.fromLTRB(43, 0, 43, 0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeConnecter(),
                        ),
                      );
                    },
                    // defining the shape
                    color: const Color(0xFF93C572),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF93C572)),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "Connection",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
