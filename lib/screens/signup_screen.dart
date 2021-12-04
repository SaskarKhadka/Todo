import 'package:flutter/material.dart';
import 'package:todo/components/custom_button.dart';
import 'package:todo/components/custom_password_field.dart';
import 'package:todo/components/custom_text_field.dart';
import 'package:todo/components/scroll_behaviour.dart';
import 'package:todo/constants/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:todo/screens/login_screen.dart';

class Signup extends StatefulWidget {
  static const String id = "/signup";
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController websiteController;
  late GlobalKey<FormState> globalKey;

  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    websiteController = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        // backgroundColor: Color(0xff264653),
        backgroundColor: Colors.white,
        // backgroundColor: const Color(0xff33CEA2),
        body: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.1,
            left: 25.0,
            right: 25.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Todo",
                style: kAppName,
              ),
              // SizedBox(
              //   height: size.height * 0.0,
              // ),
              Expanded(
                  child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 50.0,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "CREATE NEW ACCOUNT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: globalKey,
                          // autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                controller: usernameController,
                                labelText: "USERNAME",
                                icon: EvaIcons.emailOutline,
                                isEmail: true,
                              ),
                              SizedBox(
                                height: size.height * 0.035,
                              ),
                              CustomTextField(
                                controller: emailController,
                                labelText: "EMAIL",
                                icon: EvaIcons.emailOutline,
                                isEmail: true,
                              ),
                              SizedBox(
                                height: size.height * 0.035,
                              ),
                              CustomPasswordField(
                                controller: passwordController,
                                labelText: "PASSWORD",
                                icon: EvaIcons.lockOutline,
                              ),
                              SizedBox(
                                height: size.height * 0.09,
                              ),
                              CustomButton(
                                onPressed: () async {
                                  if (globalKey.currentState!.validate()) {}

                                  // setState(() {});
                                  // }
                                },
                                buttonContent: const Text(
                                  "REGISTER",
                                  style: kButtonContentTextStye,
                                ),
                                width: size.width * 0.75,
                              ),
                              const SizedBox(
                                height: 50.0,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Already have an account ?  ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, Login.id);
                                      },
                                      child: const Text(
                                        'Log In',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Montserrat",
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
