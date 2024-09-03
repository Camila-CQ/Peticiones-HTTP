
import 'ApiService.dart';
import 'Usuario.dart';

void main() async {
  ApiService apiService = ApiService();

  // Obtiene la lista de usuarios de la API
  List<Usuario> usuarios = await apiService.fetchUsuarios();

  print('Usuarios con nombre de usuario mayor a 6 caracteres:');
  apiService.filtrarUsuariosPorNombreDeUsuario(usuarios).forEach((usuario) => print(usuario.nombreDeUsuario));

  print('Cantidad de usuarios con dominio .biz:');
  print(apiService.contarUsuariosConDominioBiz(usuarios));
}
