






(String, int) getNombreEdad(){
  return ('DevCiencia', 25);
}

//Pattern matching
(String, String) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['email'] as String);
}

void main(List<String> args) {
  //record
  final (nombre, edad) = getNombreEdad();
  print('$nombre tiene $edad años');

  //pattern matching
  final (usuario,correo) = userInfo({'name': 'DevCiencia', 'email':'contacto@devciencia.com'});
  print('El correo de $usuario es $correo');
}