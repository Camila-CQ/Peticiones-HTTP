// lib/services/api_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Usuario.dart';

class ApiService {
  // Función para realizar la solicitud HTTP y obtener la lista de usuarios
  Future<List<Usuario>> fetchUsuarios() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> usuariosJson = jsonDecode(response.body);
      return usuariosJson.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los usuarios');
    }
  }

  // Función para filtrar usuarios cuyo nombre de usuario tiene más de 6 caracteres
  List<Usuario> filtrarUsuariosPorNombreDeUsuario(List<Usuario> usuarios) {
    return usuarios.where((usuario) => usuario.nombreDeUsuario.length > 6).toList();
  }

  // Función para contar usuarios cuyo correo pertenece al dominio `.biz`
  int contarUsuariosConDominioBiz(List<Usuario> usuarios) {
    return usuarios.where((usuario) => usuario.correo.endsWith('.biz')).length;
  }
}
