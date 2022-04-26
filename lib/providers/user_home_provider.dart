import 'package:flutter/cupertino.dart';

class UserHomeProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();


  String user = "";

//Con este metodo checamos si el boton fue presionado

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  set isLoading(bool value){
    _isLoading = value;

    notifyListeners();
  }


//Con este metodo controlamos que el formulario sea valido
  bool isValingForm(){


    print(formKey.currentState?.validate());

//De esta forma podemos validar el fomulario, haciendo referencia a su key
    return formKey.currentState?.validate() ?? false;
  }



}