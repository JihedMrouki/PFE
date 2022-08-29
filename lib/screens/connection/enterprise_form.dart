import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealbox/screens/connection/success.dart';

class EntrepriseForm extends StatefulWidget {
  const EntrepriseForm({Key? key}) : super(key: key);

  @override
  State<EntrepriseForm> createState() => _EntrepriseFormState();
}

class _EntrepriseFormState extends State<EntrepriseForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Positioned(
                  top: -50,
                  right: 8,
                  child: SvgPicture.asset(
                    "assets/images/BACKGROUND 2.svg", // to be fixed , svg importing is wrong
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            90, 60, 170, 54), // to be changed to right oppacity
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: const Color.fromRGBO(60, 170, 54, 1),
                      onPressed: () => Navigator.pop(context, false),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Raison sociale',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Adresse',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Ville',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Code postal',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Adresse Complémentaire',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Numero de salarié',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email de l’entreprise',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Nom',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Prénom',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email personnel',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Téléphone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(90, 108, 234,
                                0.07), // to be changed to lighter chade
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            width: 1,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 36, 36, 0),
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
                          builder: (context) => const Sucess(),
                        ),
                      );
                      // routing to next page and function to recover data or send it
                    },
                    child: Text(
                      "Envoyer",
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
          ),
        ],
      ),
    );
  }
}
