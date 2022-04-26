import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mesa_ayuda/models/models.dart';
import 'package:mesa_ayuda/providers/providers.dart';
import 'package:mesa_ayuda/themes/theme.dart';
import 'package:mesa_ayuda/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(

        future: getUserRole(),
        builder: (BuildContext context,AsyncSnapshot<List<UserRole>> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator());
          }else{
            print(getUserRole());

            return _safecuerpo();
          }
        },
      ),
    );
  }
}


  var url= Uri.parse("http://192.168.0.25:8090/userrole/all");
  Future<List<UserRole>> getUserRole()async{
    final response = await http.get(url);
    final json= jsonDecode(response.body);
    print("---------------------");
    print(json[""]);

    return userRoleFromJson(response.body);

  }





class _safecuerpo extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LoginBackGround(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              LoginCardInputWidget(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Para usar los provider es necesario el archivo Pubspec.yaml y añanir
// provider: ^5.0.0 en dependencias
                    ChangeNotifierProvider(
//Se manda el BuildContext pero aun no se ocupa
                      create: (_) => LoginFormProviver(),
                      child: _loginForm(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _loginForm extends StatelessWidget {
  const _loginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//Con esta varible podemos tenner acceso a las varialbes del Provider
    final loginForm = Provider.of<LoginFormProviver>(context);

    Map<String, dynamic> fromValues = {
      'user': '',
    };
    return Container(
      child: Form(
        key: loginForm.formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            LoginInputWidget(
                hintText: 'Usuario',
                icon: Icons.account_circle,
                helperText: 'Usuario',
                labelText: 'Usuario',
                fromValues: fromValues,
                fromProperties: 'user'),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                disabledColor: Colors.grey,
                elevation: 0,
                color: AppTheme.primary,
                child: (loginForm.isLoading)
                    ? const Text("Espere",
                        style: TextStyle(
                          color: Colors.white,
                        ))
                    : const Text("Ingresar",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: (loginForm.isLoading)
                    ? null
                    : () async {
                        if (loginForm.isValingForm()) {
                          loginForm.isLoading = true;
                          await Future.delayed(Duration(seconds: 2));
                          loginForm.isLoading = false;
//de esta forma hacemos referencia a nuestras rutas que hemos creado
                          Navigator.pushReplacementNamed(context, 'UserHome');
                          // Navigator.pushReplacementNamed(context, 'Home')
                        }
                      })
          ],
        ),
      ),
    );
  }
}
