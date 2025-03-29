import 'package:bloc/bloc.dart';
//hay q pensar el dato q vmaos a manejar 
class UsernameCubit  extends Cubit<String> {
  UsernameCubit():super('no-username'){
  print('usernamecubitcalled');
  }
  void setUserName(String username){
    emit(username);
  }

}