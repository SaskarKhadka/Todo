import 'package:flutter/material.dart';
import 'package:todo/components/custom_button.dart';
import 'package:todo/components/custom_password_field.dart';
import 'package:todo/components/custom_text_field.dart';
import 'package:todo/components/scroll_behaviour.dart';
import 'package:todo/constants/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:todo/screens/signup_screen.dart';

class Login extends StatefulWidget {
  static const String id = "/login";
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController websiteController;

  late GlobalKey<FormState> globalKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    websiteController = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
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
              SizedBox(
                height: size.height * 0.03,
              ),
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
                        Text(
                          "LOG IN",
                          textAlign: TextAlign.center,
                          style: kTextFieldLabelStyle.copyWith(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: globalKey,
                          // autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  "LOG IN",
                                  style: kButtonContentTextStye,
                                ),
                                width: size.width * 0.75,
                              ),
                              //   ],
                              // ),
                              const SizedBox(
                                height: 70.0,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ?  ',
                              style: kTextFieldLabelStyle.copyWith(
                                fontSize: 16.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Signup.id);
                              },
                              child: Text(
                                'Register',
                                style: kTextFieldLabelStyle.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
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
