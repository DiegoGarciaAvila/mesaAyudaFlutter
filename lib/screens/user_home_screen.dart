import 'package:flutter/material.dart';
import 'package:mesa_ayuda/providers/providers.dart';
import 'package:mesa_ayuda/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body:Container(
          child: ChangeNotifierProvider(
            create: (context) => UserHomeProvider(),
            child: _UserHomeCard(),
          ),
        ),
      ),
    );
  }
}

class _UserHomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserHomeForm = Provider.of<UserHomeProvider>(context);

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: const AssetImage('assets/logo_EdoMex.png'),
                  backgroundColor: Colors.amber.shade200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: UserHomeForm.formKey,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        initialValue: "Nombre",
                        decoration: const InputDecoration(
                          icon: Icon(Icons.library_books_sharp),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: "Password",
                        decoration: const InputDecoration(
                          icon: Icon(Icons.library_books_sharp),
                        ),
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: "Area",
                        decoration: const InputDecoration(
                          icon: Icon(Icons.library_books_sharp),
                        ),
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: "Password",
                        decoration: const InputDecoration(
                          icon: Icon(Icons.library_books_sharp),
                        ),
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: "Password",
                        decoration: const InputDecoration(
                          icon: Icon(Icons.library_books_sharp),
                        ),
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: "Password",
                        decoration: const InputDecoration(
                          icon: Icon(Icons.library_books_sharp),
                        ),
                      ),
                      MaterialButton(
                          disabledColor: Colors.grey,
                          elevation: 0,
                          color: AppTheme.primary,
                          child: (UserHomeForm.isLoading)
                              ? const Text("Espere",
                              style: TextStyle(
                                color: Colors.white,
                              ))
                              : const Text("Esperar",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: (UserHomeForm.isLoading)
                              ? null
                              : () async {
                            if (UserHomeForm.isValingForm()) {
                              UserHomeForm.isLoading = true;
                              await Future.delayed(Duration(seconds: 2));
                              UserHomeForm.isLoading = false;
//de esta forma hacemos referencia a nuestras rutas que hemos creado
                              Navigator.pushReplacementNamed(context,'UserHome');
                              // Navigator.pushReplacementNamed(context, 'Home')
                            }
                          })
                    ],
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// "https://i.pinimg.com/originals/b1/5d/ba/b15dbab04d8640bf504bb16166e74db6.png"
