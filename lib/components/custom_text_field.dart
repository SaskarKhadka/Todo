import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isEmail;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.isEmail = false,
  }) : super(key: key);

  String? validateUserName(String? website) {
    if (website!.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return "Required";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email)) {
      return "Email not valid";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: isEmail ? validateEmail : validateUserName,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        label: Text(
          labelText,
        ),
        labelStyle: kTextFieldLabelStyle,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      style: kTextFieldTextStyle,
    );
  }
}
