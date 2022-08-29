import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealbox/screens/menu/boissons.dart';
import 'package:mealbox/screens/menu/desserts.dart';
import 'package:mealbox/screens/menu/entree.dart';
import 'package:mealbox/screens/menu/plats.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.2, // needs to be fixed because of sizing and screen needs scrolling
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 80, 18, 20),
                    child: Column(
                      children: [
                        Center(
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
                        Padding(
                          padding: const EdgeInsets.all(7),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
              child: SizedBox(
                height: 500,
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25.0)),
                      child: TabBar(
                        indicator: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius: BorderRadius.circular(25.0)),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(
                            text: 'Plats',
                          ),
                          Tab(
                            text: 'Entrées',
                          ),
                          Tab(
                            text: 'Desserts',
                          ),
                          Tab(
                            text: 'Boissons',
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
                      child: Divider(
                        indent: 100,
                        endIndent: 100,
                        thickness: 4.0,
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          Center(
                            // child: Text("Plats"),
                            child: Plats(),
                          ),
                          Center(
                            child: Entree(),
                          ),
                          Center(
                            child: Desserts(),
                          ),
                          Center(
                            child: Boissons(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
