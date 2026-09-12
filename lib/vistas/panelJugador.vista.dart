import 'package:flutter/material.dart';
import 'package:juego_cartas/modelos/carta.dart';

class PanelJugador extends StatelessWidget {

final List<Carta> cartas;

final Color colorfondo;

const PanelJugador({required this.cartas, required this.colorfondo});

  @override
  Widget build(BuildContext context) {
  
  return Container(
  
  color: colorfondo,
  child: Stack(

   children: List.generate(cartas.length, (indice){

      return Positioned(

        left: indice * 30.0, // Ajusta el valor para cambiar la superposición

        child: Image.asset(
          cartas[indice].rutaImagen
        ),

      );

    }),

  )
  
  
  
  );

  }

}