import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class LoginInputWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String helperText;
  final String labelText;
  final Map<String, dynamic> fromValues;
  final String fromProperties;
  final bool? obscureText;
  const LoginInputWidget(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.helperText,
      required this.labelText,
      required this.fromValues,
      required this.fromProperties,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProviver>(context);

    return TextFormField(
      onChanged: (value) {
        loginForm.user = value;
        print(loginForm.user);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (fromProperties == 'user') {
          return (value != null && value.length >= 6)
              ? null
              : 'La contraseña debe ser mayor a 6 caracteres';
        }

      },
      decoration: InputDecoration(
        hintText: hintText,
        icon: Icon(icon),
        helperText: helperText,
        labelText: labelText,
      ),
    );
  }
}
