import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationUi extends StatelessWidget {
  const VerificationUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var autoFocus = false;
    var controller3;
    var controller2;
    var controller1;
    var controller;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                Positioned(
                  top: -50,
                  right: 8,
                  child: SvgPicture.asset(
                    "assets/images/inscription.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 8,
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
                Positioned(
                  top: 100,
                  left: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Entrez 4 chiffres \nCode de vérification",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 175, 0, 8),
                  child: Text(
                    "Code envoyé au ${216282045}. Ce code expirera dans 01h30", // number to be edited depends on the data
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                    width: 50,
                    child: TextFormField(
                      autofocus: autoFocus,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: controller,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        filled: true,
                        fillColor:
                            // Color.fromRGBO(141, 170, 30, 0.10000000149011612),
                            Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        counterText: '',
                        hintStyle: const TextStyle(
                            color: Colors.black, fontSize: 20.0),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 50,
                    child: TextField(
                      autofocus: autoFocus,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: controller1,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          counterText: '',
                          hintStyle:
                              const TextStyle(color: Colors.black, fontSize: 20.0)),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 50,
                    child: TextField(
                      autofocus: autoFocus,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: controller2,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          counterText: '',
                          hintStyle:
                              const TextStyle(color: Colors.black, fontSize: 20.0)),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 50,
                    child: TextField(
                      autofocus: autoFocus,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: controller3,
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          counterText: '',
                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 20.0)),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Si vous n'avez pas reçu de code ...",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Répeter",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
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
                
              },
              child: Text(
                "Suivant",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
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
    );
  }
}
