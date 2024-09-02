// lib/main.dart

import 'ApiService.dart';
import 'Usuario.dart';

void main() async {
  ApiService apiService = ApiService();

  // Obtiene la lista de usuarios de la API
  List<Usuario> usuarios = await apiService.fetchUsuarios();

  // Muestra los usuarios con un nombre de usuario mayor a 6 caracteres
  print('Usuarios con nombre de usuario mayor a 6 caracteres:');
  apiService.filtrarUsuariosPorNombreDeUsuario(usuarios).forEach((usuario) => print(usuario.nombreDeUsuario));

  // Muestra la cantidad de usuarios con correo electrónico del dominio `.biz`
  print('Cantidad de usuarios con dominio .biz:');
  print(apiService.contarUsuariosConDominioBiz(usuarios));
}
