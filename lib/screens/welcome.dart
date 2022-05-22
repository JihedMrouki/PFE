// ignore: file_names
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealbox/screens/connection/select_entreprise.dart';
import 'package:mealbox/screens/inscription/confirmation.dart';
import 'connection/connection.dart';

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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.49,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/welcome.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
              child: Text(
                'Une formule de votre meal\n préféré livrée au bureau',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
              child: Text(
                'à partir de 14 Dt',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(60, 170, 54, 1))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 170, 54, 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(375, 60),
                                  primary: Color.fromARGB(224, 237, 235, 235),
                                  side: BorderSide(
                                      width: 0,
                                      color:
                                          Color.fromARGB(224, 237, 235, 235)),
                                  //shadowColor: Colors.greenAccent,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectEntreprise(),
                                    ),
                                  );
                                },
                                label: Text(
                                  "Trouver mon Entreprise ...",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                              child: Text(
                                "LIVRAISON OFFERTE",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/arrow.svg',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                  child: SvgPicture.asset(
                    'assets/images/verifier.svg',
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(375, 60),
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                side: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                                //shadowColor: Colors.greenAccent,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SeConnecter()));
                              },
                              child: Text(
                                "Connection",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    //color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
