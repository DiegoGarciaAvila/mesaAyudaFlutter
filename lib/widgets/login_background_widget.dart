import 'package:flutter/material.dart';
import 'package:mesa_ayuda/themes/theme.dart';

class LoginBackGround extends StatelessWidget {
  final Widget child;

  const LoginBackGround({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
//Stack sirve para poner un widget encima de otro
      child: Stack(
        children: [
          _PurpleScreen(),

//El safeArea es para detectar si el telefono tiene el espacio de la camara en patanlla
          _HeaderIcon(),

          this.child,
        ],
      ),
    ));
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: const Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 100,
        ),
        width: double.infinity,
      ),
    );
  }
}

class _PurpleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//Con esta variable podemos controlar el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
//Al multiplicar la variable por .4 decimos que el valor sera el 40% de la pantalla
      height: size.height * .4,
//
      decoration: const BoxDecoration(
        color: AppTheme.primary,
      ),
      child: Stack(
//Con la positioned, haces algo parecido a un container pero le damos los valores de la posicion
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -50, right: -20),
          Positioned(child: _Bubble(), bottom: -50, left: 10),
          Positioned(child: _Bubble(), bottom: 120, right: 20),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.3)),
    );
  }
}
