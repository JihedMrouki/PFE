import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mealbox/screens/inscription/verification.dart';
import 'package:validators/validators.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  bool test = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordConfirmationController =
      new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  validator() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('validated');
    } else
      print('not valide !');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height *
              0.3, // needs to be fixed because of sizing and screen needs scrolling
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
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 90, 18, 20),
                child: Column(children: [
                  Center(
                    child: Text(
                      "S’INSCRIRE",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 34, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Text(
                    "POUR CONTINUER",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ),
                ]),
              ),
            ],
          ),
        ),
        Mutation(
          options: MutationOptions(
            document: gql(customerRegister),
            onCompleted: (dynamic data) {
              if (data != null) {
                (Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VerificationUi()),));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Erreur Something not right"),
                ));
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
                      padding: EdgeInsets.fromLTRB(18, 0, 18, 8),
                      child: TextFormField(
                        controller: lastNameController,
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Cette champ est obligatoire ';
                          }
                          return null;
                        },
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
                      padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
                      child: TextFormField(
                        controller: firstNameController,
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Cette champ est obligatoire ';
                          }
                          return null;
                        },
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
                      padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) => isEmail(value.toString())
                            ? null
                            : "Please enter a valid email",
                        decoration: InputDecoration(
                            hintText: 'Email',
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
                      padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
                      child: TextFormField(
                        controller: phoneController,
                        validator: (String? value) {
                          if (value == null || value.length != 8) {
                            return 'Votre numero de telephone doit etre 8 numero ';
                          }
                          return null;
                        },
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
                      padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
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
                                    ? Icon(Icons.remove_red_eye_sharp)
                                    : Icon(Icons.visibility_off)),
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
                      padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
                      child: TextFormField(
                        controller: passwordConfirmationController,
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Cette champ est obligatoire ';
                          } else if (value != passwordController.text) {
                            return 'Password Not match';
                          }
                          return null;
                        },
                        obscureText: test ? false : true,
                        decoration: InputDecoration(
                            hintText: 'Confirmation Mot de Passe',
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    test = !test;
                                  });
                                },
                                child: test
                                    ? Icon(Icons.remove_red_eye_sharp)
                                    : Icon(Icons.visibility_off)),
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
                      padding: EdgeInsets.fromLTRB(36, 18, 36, 8),
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
                              'firstName': firstNameController.text.trim(),
                              'lastName': lastNameController.text.trim(),
                              'email': emailController.text,
                              'password': passwordController.text,
                              'phone': {
                                'country': 'TN',
                                'number': phoneController.text,
                              },
                            });
                          }
                        },
                        child: Text(
                          "Suivant",
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
      ]),
    );
  }
}

String customerRegister = """
  mutation(
  \$lastName:String!,
  \$firstName:String!,
  \$email:String!,
  \$phone: CustomerRegisterPhoneInput!
  \$password: String!
) {
  customerRegister(
    CustomerRegisterInput: {
      lastName: \$lastName
      firstName: \$firstName
      email: \$email
      phone: \$phone
      password: \$password
    }
  )
}

""";
