
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Usuario.dart';

class ApiService {
  Future<List<Usuario>> fetchUsuarios() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> usuariosJson = jsonDecode(response.body);
      return usuariosJson.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los usuarios');
    }
  }

  List<Usuario> filtrarUsuariosPorNombreDeUsuario(List<Usuario> usuarios) {
    return usuarios.where((usuario) => usuario.nombreDeUsuario.length > 6).toList();
  }

  int contarUsuariosConDominioBiz(List<Usuario> usuarios) {
    return usuarios.where((usuario) => usuario.correo.endsWith('.biz')).length;
  }
}
