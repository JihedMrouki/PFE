// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mealbox/screens/connection/loginsucess.dart';
import 'package:validators/validators.dart';
import '../../services/shared_preference.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SeConnecter extends StatefulWidget {
  const SeConnecter({Key? key}) : super(key: key);

  @override
  State<SeConnecter> createState() => _SeConnecterState();
}

class _SeConnecterState extends State<SeConnecter> {
  @override
  void initState() {
    super.initState();
    getSharedValues();
  }

  getSharedValues() async {
    bool value = await sharedPreferenceService.getSharedPreferencesInstance();
    if (value) print(await sharedPreferenceService.token);
  }

  final _formKey = GlobalKey<FormState>();

  SharedPreferenceService sharedPreferenceService = SharedPreferenceService();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool test = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return ListView(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/BACKGROUND 2.svg", // to be fixed , svg importing is wrong
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      top: 75,
                      child: SvgPicture.asset(
                        "assets/images/Frame.svg", // to be fixed , svg importing is wrong
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 8,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(90, 60, 170,
                                54), // to be changed to right oppacity
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new),
                          color: const Color.fromRGBO(60, 170, 54, 1),
                          onPressed: () => Navigator.pop(context, false),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 260,
                      bottom: 14,
                      child: Text(
                        "SE CONNECTER",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 34, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 300,
                      bottom: 0,
                      child: Text(
                        "POUR CONTINUER",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Mutation(
              options: MutationOptions(
                document: gql(customerLogin),
                update: (GraphQLDataProxy cache, QueryResult? result) {
                  return cache;
                },
                onCompleted: (dynamic data) async {
                  if (data != null) {
                    final _token = data['customerLogin']['accessToken'];
                    if (_token != null) {
                      await sharedPreferenceService.setToken(_token);
                      print(await sharedPreferenceService.token);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login successful"),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginSucess(),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Erreur Email ou mot de passe invalide"),
                      ),
                    );
                  }
                },
              ),
              builder: (runMutation, result
                  // RunMutation runMutation,
                  // QueryResult? result,
                  ) {
                return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) => isEmail(value.toString())
                                ? null
                                : "Please enter a valid email",
                            decoration: InputDecoration(
                                hintText: 'Email / Telephone',
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
                          padding: const EdgeInsets.fromLTRB(18, 15, 18, 10),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (String? value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Cette champ est obligatoire ';
                              }
                              return null;
                            },
                            obscureText: test ? false : true,
                            decoration: InputDecoration(
                                hintText: 'Mot de Passe',
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        test = !test;
                                      });
                                    },
                                    child: test
                                        ? const Icon(Icons.remove_red_eye_sharp)
                                        : const Icon(Icons.visibility_off)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors
                                        .white, // to be changed to lighter chade
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
                          padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Mot de passe oublié",
                                  style: TextStyle(
                                      color: Color.fromRGBO(60, 170, 54, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Divider(
                            indent: 100,
                            endIndent: 100,
                            thickness: 4.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                runMutation({
                                  'username': emailController.text,
                                  'password': passwordController.text,
                                });
                              }
                            },
                            child: Text(
                              "Connection",
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
                    ));
              },
            ),
          ],
        );
      }),
    );
  }
}

String customerLogin = """
mutation(
  \$username: String!,
 \$password: String!
 ) {
   customerLogin(
     CustomerLoginInput:{
  emailOrPhone:\$username
  password:\$password
  
}){accessToken}}

""";
