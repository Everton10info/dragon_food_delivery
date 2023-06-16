import 'package:flutter/material.dart';

class ApptextFormField extends StatefulWidget {
  const ApptextFormField({super.key});

  @override
  State<ApptextFormField> createState() => _ApptextFormFieldState();
}

class _ApptextFormFieldState extends State<ApptextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Color(0XFFE5E1E1)),
      cursorColor: const Color(0xFFE5E1E1),
      decoration: const InputDecoration(
        focusColor: Color(0xffF1CE39),
        hintText: 'Login',
        hintStyle: TextStyle(
          color: Color(0xFFE5E1E1),
        ),
        errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        errorStyle: TextStyle(color: Color(0xffDB7E76)), // Color(0xffF1CE39)),
        filled: true,
        fillColor: Color(0xFF474747),
        focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        border: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      //   controller: _controllerEmail,
      validator: (value) {
        if (value!.isNotEmpty &&
            value.contains('@') &&
            value.contains('.com')) {
          return null;
        } else {
          return 'Preencha o campo com email válido';
        }
      },
    );
  }
}
