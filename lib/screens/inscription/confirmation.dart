import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class confirmation extends StatefulWidget {
  const confirmation({Key? key}) : super(key: key);

  @override
  _confirmationState createState() => _confirmationState();
}

class _confirmationState extends State<confirmation> {
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
            child: Text(
              'Votre compte est pret !',
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                // Get.to(() => inscription());
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Text(
                  "Commencer",
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
