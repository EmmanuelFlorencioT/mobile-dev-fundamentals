import 'package:complete_app/home.dart';
import 'package:complete_app/utils/singleton.dart';
import 'package:complete_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:complete_app/utils/constants.dart' as my_constants;
import 'package:geolocator/geolocator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController();
  final mail = TextEditingController();
  final psswd = TextEditingController();

  bool _validateUser = false;
  bool _validateMail = false;
  bool _validatePassword = false;

  @override
  void initState() {
    checkPosition();
    super.initState(); //The parent is responsible of creating all the variables
  }

  Singleton singleton = Singleton();

  void checkPosition() async {
    //This function will be triggered once it has the response, since it is async
    //There is a need to make it async since initState cannot wait to get a response because it is creating the view itself.
    Position position = await Utils.determinePosition();
    singleton.latitude = position.latitude;
    singleton.longitude = position.longitude;
  }

  @override
  Widget build(BuildContext context) {
    //Check for the device size. To scale the height and width of the image.
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: my_constants.appYellow,
      body: Stack(
        children: [
          SingleChildScrollView(
            /*padding: const EdgeInsets.all(25),*/
            padding:
                const EdgeInsets.only(left: 0, top: 80, right: 0, bottom: 0),
            child: Column(
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  //Spacing between widgets
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width,
                  height: size.height -
                      (80 +
                          60 +
                          size.height *
                              0.02), //The sum of the padding top, font size and sized box
                  padding: const EdgeInsets.only(
                      left: 80, top: 100, right: 80, bottom: 0),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(120)),
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    TextFormField(
                      controller: user,
                      obscureText: false,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: my_constants.appYellow,
                                width: 1, //1px
                                style: BorderStyle.none)),
                        filled: true,
                        fillColor: my_constants.appYellow,
                        hintText: 'Username',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        errorText: _validateUser ? 'Incorrect Username' : null,
                      ),
                      onChanged: (userText) {
                        setState(() {
                          if (userText.trim().isNotEmpty) {
                            //Get rid of the spaced in the TextFromField
                            _validateUser = false;
                          }
                        });
                      },
                    ),
                    SizedBox(
                      //Spacing between widgets
                      height: size.height * 0.05,
                    ),
                    //const TextFormPrompt(textPrompt: 'E-mail:'), //Uses Hint Text instead
                    TextFormField(
                      controller: mail,
                      obscureText: false,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: my_constants.appYellow,
                                width: 1, //1px
                                style: BorderStyle.none)),
                        filled: true,
                        fillColor: my_constants.appYellow,
                        hintText: 'E-mail',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        errorText: _validateMail ? 'Incorrect Email' : null,
                      ),
                      onChanged: (mailText) {
                        if (mailText.trim().isNotEmpty) {
                          _validateMail = false;
                        }
                      },
                    ),
                    SizedBox(
                      //Spacing between widgets
                      height: size.height * 0.05,
                    ),
                    //const TextFormPrompt(textPrompt: 'Password:'), //Uses Hint Text instead
                    TextFormField(
                      controller: psswd,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: my_constants.appYellow,
                                width: 1, //1px
                                style: BorderStyle.none)),
                        filled: true,
                        fillColor: my_constants.appYellow,
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        errorText:
                            _validatePassword ? 'Incorrect Password' : null,
                      ),
                      onChanged: (passText) {
                        if (passText.trim().isNotEmpty) {
                          _validatePassword = false;
                        }
                      },
                    ),
                    SizedBox(
                      //Spacing between widgets
                      height: size.height * 0.12,
                    ),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: my_constants.appPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fixedSize: Size(size.width * 0.75, 45),
                        ),
                        onPressed: () {
                          setState(() {
                            //_validateUser = user.text.isNotEmpty ? false : true;

                            //This is the equivalent
                            user.text.isNotEmpty
                                ? _validateUser = false
                                : _validateUser = true;

                            _validateMail = mail.text.isNotEmpty ? false : true;
                            _validatePassword =
                                psswd.text.isNotEmpty ? false : true;

                            if (user.text.isNotEmpty &&
                                user.text == my_constants.defaultUser) {
                              //Go to the next Screen
                            } else {
                              _validateUser = true;
                            }

                            if (mail.text.isNotEmpty &&
                                mail.text == my_constants.defaultEmail) {
                              //Go to next Screen
                            } else {
                              _validateMail = true;
                            }

                            if (validateMail(mail.text) == '1') {
                              //Correct Mail
                            } else {
                              _validateMail = true;
                            }

                            if (psswd.text.isNotEmpty &&
                                psswd.text == my_constants.defaultPassword) {
                              //Go to next Screen
                            } else {
                              _validatePassword = true;
                            }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          });
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
                )
                //const TextFormPrompt(textPrompt: 'Username:'), //Uses Hint Text instead
              ],
            ),
          )
        ],
      ),
    );
  }

  String? validateMail(String email) {
    Pattern passPattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regexpPass = RegExp(passPattern.toString());

    if (regexpPass.hasMatch(email)) {
      //Mail matches with the regular expression
      return '1';
    }
    return '0';
  }
}

class TextFormPrompt extends StatelessWidget {
  final String textPrompt;
  const TextFormPrompt({super.key, required this.textPrompt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            textPrompt,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
