
class Usuario {
  final int id;
  final String nombre;
  final String nombreDeUsuario;
  final String correo;

  Usuario({
    required this.id,
    required this.nombre,
    required this.nombreDeUsuario,
    required this.correo,
  });

  // Constructor factory para crear una instancia de Usuario desde un JSON (Map)
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['name'],
      nombreDeUsuario: json['username'],
      correo: json['email'],
    );
  }
}
