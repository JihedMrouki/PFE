import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealbox/screens/welcome.dart';

class Sucess extends StatefulWidget {
  const Sucess({Key? key}) : super(key: key);

  @override
  _SucessState createState() => _SucessState();
}

class _SucessState extends State<Sucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.18),
          Center(child: SvgPicture.asset('assets/images/confirmation.svg')),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 8),
                  child: Text(
                    'Félicitations!',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(60, 170, 54, 1),
                            fontSize: 34,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                Text(
                  'Votre demande est envoyé!',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(36, 18, 36, 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(375, 60),
                primary: const Color.fromRGBO(60, 170, 54, 1),
                onPrimary: Colors.white,
                side: const BorderSide(
                  width: 1,
                  color: Color.fromARGB(158, 60, 170, 1),
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
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
              child: Text(
                "Retourn au page d'acceuil",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    //color: Colors.black
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
