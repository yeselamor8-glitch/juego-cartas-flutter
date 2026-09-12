import 'dart:math';
import 'package:juego_cartas/modelos/carta.dart';
import 'package:juego_cartas/modelos/enumerados.dart';

class Jugador {

List<Carta> cartas = [];

final Random r = Random();

void repartir() {
  cartas = List.generate(10, (_) => Carta(r));
}

String getGrupos() {

String resultado = ""; 

List<int > contadores = List.filled(NombreCarta.values.length, 0); // Inicializa un contador para cada tipo de carta

for (var carta in cartas) {
  contadores[carta.nombre.index]++;
}

for (int i = 0; i < contadores.length; i++) {
  if (contadores[i] >= 2) { // Si hay 3 o más cartas del mismo tipo
    resultado += "${Grupo.values[contadores[i]].name } de ${NombreCarta.values[i].name} \n";
  }
}
return resultado.isEmpty ? "No hay grupos" : "Se encontraron los siguientes grupos: \n $resultado";
}


}