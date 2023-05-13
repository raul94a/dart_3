void main(List<String> args) {
  (String, int, String) getNombreEdadEmail() {
    return ('DevCiencia', 25, 'contacto@devciencia.com');
  }

  final (nombre, edad, email) = getNombreEdadEmail();
  print('$nombre tiene $edad años y su email es $email');


  //Pattern matching
  (String, String) userInfo(Map<String, dynamic> json) {
    return (json['name'] as String, json['email'] as String);
  }

  final (usuario, correo) =
      userInfo({'name': 'DevCiencia', 'email': 'contacto@devciencia.com'});
  print('El correo de $usuario es $correo');



}
