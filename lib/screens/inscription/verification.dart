import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../inscription/confirmation.dart';

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
          Container(
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
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.black,
                  onPressed: () => Navigator.pop(context, false),
                ),
                Positioned(
                  top: 150,
                  left: MediaQuery.of(context).size.width * 0.25,
                  child: Column(children: [
                    Center(
                      child: Text(
                        "Verification",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "POUR CONTINUER",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400)),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                    filled: true,
                    fillColor:
                        Color.fromRGBO(141, 170, 30, 0.10000000149011612),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    counterText: '',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
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
                    filled: true,
                    fillColor:
                        Color.fromRGBO(141, 170, 30, 0.10000000149011612),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    counterText: '',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
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
                    filled: true,
                    fillColor:
                        Color.fromRGBO(141, 170, 30, 0.10000000149011612),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    counterText: '',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
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
                    filled: true,
                    fillColor:
                        Color.fromRGBO(141, 170, 30, 0.10000000149011612),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    counterText: '',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
            ),
          ]),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Si vous n'avez pas reçu de code ... ",
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => confirmation()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Text(
                  "Suivant",
                  style: GoogleFonts.roboto(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromRGBO(147, 197, 114, 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
