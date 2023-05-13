// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';




void main(List<String> args) {
  final (user,location) = getRecord();
  print('${user.name} está en (${location.lat},${location.long})');

  final (String name, String? email) = userInfo({'name': 'DevCiencia', 'email': 'devciencia@contacto.com'});
  print('Pattern matching. El correo electrónico de $name es $email');
  
  //la clave password no existe en el record devuelto por userInfoNullable
  final (String name2, String? email2) = userInfoNullable({'name': 'DevCiencia', 'password': 'devciencia@contacto.com'});
    print('Pattern matching nullable. El correo electrónico de $name2 es $email2');

  final random = Random().nextInt(10);
  const number = 7;
  switch(random){
    case > number:
      print('$random > $number');
      break;
    case == number:
      print('$random = $number');
      break;
    case < number:
      print('$random < $number');
      break;
  }

}


//Records
(User,Location) getRecord(){
  final user = User(name: 'DevCiencia', email: 'devciencia@contacto.com');
  final location = Location(lat: 0.01, long: -14.73);
  return (user,location);
}

//Pattern matching
(String, String?) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['email']);
}

//Pattern matching nullable
(String, String?) userInfoNullable(Map<String, dynamic> json) {
  return (json['name'] as String, json['email']);
}



class User {
  final String name;
  final String email;
  User({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Location {
  final double lat;
  final double long;
  Location({
    required this.lat,
    required this.long,
  });
}
