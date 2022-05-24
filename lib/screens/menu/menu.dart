import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(
            height : 80,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
              child: Text(
                "Composez votre formule",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 141, 54),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Prenez ce qui vous plait, on compose votre formule !",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
         
         const Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Divider(
              indent: 100,
              endIndent: 100,
              thickness: 4.0,
            ),
          ),
          
        ], 
      ),
    );
  }
}
