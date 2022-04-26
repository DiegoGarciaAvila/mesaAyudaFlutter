import 'package:flutter/material.dart';

class LoginCardInputWidget extends StatelessWidget {
  final Widget child;

  const LoginCardInputWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: this.child,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
//El boxShadow nos sirve para darle sombra al widget
            boxShadow: const [
              BoxShadow(color: Colors.black12, offset: Offset(10, 10))
            ]),
      ),
    );
  }
}
