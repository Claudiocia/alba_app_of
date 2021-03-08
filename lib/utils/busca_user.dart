import 'package:alba_app/helpers/usuario_helper.dart';
import 'package:alba_app/models/usuario_model.dart';

class BuscaUser {
  BuscaUser();

  UsuarioModel user = UsuarioModel();
  UsuarioHelper helper = UsuarioHelper();
  bool isLoading = false;

  Future<UsuarioModel> userExist() async{
    isLoading = true;

    await helper.getUser().then((value){
      if(value != null){
        user = value;
        print("Método UserExist da classe BuscaUser retorna true ==> ${user.toString()}");
        return user;
      }else{
        print("Método UserExist da classe BuscaUser retorna false ==> ${user.toString()}");
        return null;
      }
    });
  }


}