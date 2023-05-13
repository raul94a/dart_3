import 'dart:math';

enum PosicionFutbol { delantero, defensa, portero, centrocampista }

enum PosicionBaloncesto { base, alero, pivot, alaPivot }

//base class actuará como una clase abstracta, otorgándole sus atributos a la clase que extiendan.
base class EstadisticasFisicas {
  final double fuerza;
  final double velocidad;
  final double agilidad;
  final double salto;
  final double precision;
  final double aceleracion;

  const EstadisticasFisicas(
      {required this.fuerza,
      required this.velocidad,
      required this.agilidad,
      required this.salto,
      required this.precision,
      required this.aceleracion});
  
  void mejorar(){print('Ha mejorado');}
}

//clase de interfaz para establecer un contrato entre clases, es decir, una serie de métodos comunes en nombre,
//pero cuya implementación puede ser diferente
interface class Humano {
 
  void caminar() {
    // TODO: implement caminar
  }
  void correr() {
    //TODO: implement correr
  }
  void nadar() {
    //TODO: implement correr
  }
}

//las sealed classes actuan como si fueran abstractas.
//Deportista implementa la interfaz Humano
//El objetivo de la sealed class en esta demo es el pattern matching exhaustivo en el switch de la función
//accionDelDeportista, donde se mostrará un error si no se tienen en cuenta todos las posibles variaciones.
//En este caso, dentro del switch deben estar los casos para Futbolista y Baloncestista, ya que son las únicas
//clases que heredan de la sealed class Deportista

sealed class Deportista extends EstadisticasFisicas implements Humano {
  const Deportista(
      {required this.edad,
      required super.fuerza,
      required super.velocidad,
      required super.agilidad,
      required super.salto,
      required super.precision,
      required super.aceleracion});
  final int edad;
}

//Las final class no pueden ser heredadas. Además, Futbolista hereda de Deportista. Esto significa que
//hereda la edad definida en Deportista y los métodos que implementa la interfaz Humano
final class Futbolista extends Deportista {
  final String nombre;
  final PosicionFutbol posicion;
  const Futbolista(
      {required super.edad,
      required this.nombre,
      required this.posicion,
      required super.fuerza,
      required super.velocidad,
      required super.agilidad,
      required super.salto,
      required super.precision,
      required super.aceleracion});
  @override
  void caminar() {
    print('$nombre está caminando');
  }

  @override
  void correr() {
    print('$nombre está corriendo');
  }

  @override
  void nadar() {
    throw Exception('Un Futbolista no puede nadar durante un partido.');
  }

  void chutar() {
    int numero = Random().nextInt(3);
    String accion = '';
    switch (numero) {
      case 0:
        accion = 'parada del portero';
        break;
      case 1:
        accion = 'la pelota choca en un defensa';
        break;
      case 2:
        accion = '¡Golazo!';
    }
    print('$nombre chuta a puerta y... $accion');
  }
}

final class Baloncestista extends Deportista {
  final String nombre;
  final PosicionBaloncesto posicion;
  const Baloncestista(
      {required super.edad,
      required this.nombre,
      required this.posicion,
      required super.fuerza,
      required super.velocidad,
      required super.agilidad,
      required super.salto,
      required super.precision,
      required super.aceleracion});
  @override
  void caminar() {
    print('$nombre está caminando');
  }

  @override
  void correr() {
    print('$nombre está corriendo');
  }

  @override
  void nadar() {
    throw Exception('Un Baloncestista no puede nadar durante un partido.');
  }

  void tirar() {
    bool exito = Random().nextBool();
    print('$nombre tira a canasta y... ${exito ? '¡acierta!' : ' falla :('}');
  }

  @override
  void mejorar(){
    print('¡$runtimeType ha mejorado!');
  }

  
  
}

void accionDelDeportista(Deportista a) {
  switch (a) {
    case Futbolista f:
      f.chutar();
      
    case Baloncestista b:
      b.tirar();
      b.mejorar();
  }
}

//Al ser Baloncestita una final class, no puede heredarse, por lo que Alero estaría mal declarada.
// class Alero extends Baloncestista{}

void main(List<String> args) {
  final futbolista = Futbolista(
      fuerza: 10,
      velocidad: 25,
      salto: 11,
      aceleracion: 50,
      precision: 66,
      agilidad: 80,
      edad: 23,
      nombre: 'DevCiencia',
      posicion: PosicionFutbol.defensa);

  final baloncestita = Baloncestista(
      fuerza: 30,
      velocidad: 20,
      salto: 80,
      aceleracion: 30,
      precision: 90,
      agilidad: 50,
      edad: 25,
      nombre: 'DevCiencia',
      posicion: PosicionBaloncesto.alero);

  accionDelDeportista(futbolista);
  accionDelDeportista(baloncestita);
}
