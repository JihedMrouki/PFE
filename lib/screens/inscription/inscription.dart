import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mealbox/screens/inscription/verification.dart';
import 'package:validators/validators.dart';

class inscription extends StatefulWidget {
  const inscription({Key? key}) : super(key: key);

  @override
  _inscriptionState createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
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
                icon: Icon(Icons.arrow_back_ios_new),
                color: Colors.black,
                onPressed: () => Navigator.pop(context, false),
              ),
              Positioned(
                top: 100,
                left: MediaQuery.of(context).size.width * 0.25,
                child: Column(children: [
                  Center(
                    child: Text(
                      "S’INSCRIRE",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "POUR CONTINUER",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
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
                    MaterialPageRoute(builder: (context) => VerificationUi())));
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: lastNameController,
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Cette champ est obligatoire ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Prenom',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color.fromARGB(224, 237, 235, 235)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color.fromARGB(224, 237, 235, 235)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) => isEmail(value.toString())
                            ? null
                            : "Please enter a valid email",
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color.fromARGB(224, 237, 235, 235)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: phoneController,
                        validator: (String? value) {
                          if (value == null || value.length != 8) {
                            return 'Votre numero de telephone doit etre 8 numero ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'numero de telephone',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color.fromARGB(224, 237, 235, 235)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color.fromARGB(224, 237, 235, 235)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color.fromARGB(224, 237, 235, 235)),
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),

                    //Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () async {
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
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          child: Text(
                            "Suivant",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromRGBO(147, 197, 114, 1),
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
