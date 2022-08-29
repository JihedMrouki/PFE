// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mealbox/screens/connection/enterprise_form.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mealbox/screens/inscription/inscription.dart';

class SelectEntreprise extends StatefulWidget {
  const SelectEntreprise({Key? key}) : super(key: key);

  @override
  State<SelectEntreprise> createState() => _SelectEntrepriseState();
}

class _SelectEntrepriseState extends State<SelectEntreprise> {
  String? _latitude;
  String? _longitude;
  dynamic dataEntrepriseList;

  Future<void> _updatePosition() async {
    Position pos = await _determinePosition();
    setState(() {
      _latitude = pos.latitude.toString();
      _longitude = pos.longitude.toString();
    });
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  bool isSelected = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
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
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 4),
            child: Text(
              "Choisissez votre entreprise",
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500)),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.all(12),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 200,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nom de l’entreprise",
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 18),
                            isDense: true,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          // onChanged: () {},  // on changed parameter for the search function
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    child: const Icon(
                      Icons.location_on_rounded,
                      size: 30,
                      color: Color.fromRGBO(60, 170, 54, 1),
                    ),
                    //onPressed: _updatePosition,
                    onPressed: (){
                      setState(() {
                        isSelected = true;
                      });
                      _updatePosition();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      // shape: const CircleBorder(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25), // <-- Radius
                      ),
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 8, 18, 8),
            child: Text(
              'Entreprise trouvé',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500)),
            ),
          ),

          Query(
              options: QueryOptions(
                // variables: {
                //   'location': _latitude != null
                //       ? {
                //           'latitude': _latitude,
                //           'longitude': _longitude,
                //         }
                //       : null
                // },
                document: gql(companySearch),
                fetchPolicy: FetchPolicy.cacheAndNetwork,
              ),
              builder: (QueryResult result, {refetch, fetchMore}) {
                if (result.hasException) {
                  // return Text(result.exception.toString());
                  return const Text("Accune entreprise trouvé a cette location");
                }

                if (result.isLoading) {
                  return const Center(
                    //child: CircularProgressIndicator(),
                    child: Text("Accune entreprise trouvé a cette location")
                  );
                }

                dataEntrepriseList = result.data?['entrepriseSearch'];

                return SizedBox(
                  height: 400,
                  child: 
                  isSelected == false?
                  Container():
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataEntrepriseList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                              right:  Radius.circular(15),
                              left:  Radius.circular(15),
                            ),
                            side: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          leading: SvgPicture.asset(
                            "assets/images/entreprise_logo.svg",
                            height: 28,
                          ),
                          title: Text(dataEntrepriseList[index]['name']),
                          subtitle: Row(
                            children: [
                              Text(dataEntrepriseList[index]['address']
                                  ['street']),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(dataEntrepriseList[index]['address']
                                    ['city']),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(dataEntrepriseList[index]['address']
                                    ['country']),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>  Inscription(),
                                    ),
                                  );
                          },
                        ),
                      );
                    },
                  ),
                );
              }),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(375, 60),
                  primary: const Color.fromARGB(117, 83, 235, 75),
                  side: const BorderSide(
                      width: 0, color: Color.fromARGB(224, 237, 235, 235)),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EntrepriseForm(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                          child: Text(
                            "Votre entreprise n'est pas là?",
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Text(
                            "Envoyez une demande de réferancement",
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String companySearch = """
query companySearch(\$name: String, \$location: SearchEntrepriseByLocationArgs) {
  entrepriseSearch(
    name: \$name,
    location: \$location
  ) {
    name
    address {
      street
      city
      country
    }
  }
}

""";
}