import 'package:flutter/material.dart';
import 'package:juego_cartas/modelos/jugador.dart';
import 'package:juego_cartas/vistas/panelJugador.vista.dart';

class JuegoVista extends StatefulWidget {
  const JuegoVista({super.key});

  @override
  State<StatefulWidget> createState() => _JuegoState();
}

class _JuegoState extends State<JuegoVista> {

Jugador jugador1 = Jugador();
Jugador jugador2 = Jugador();

void _repartir() {

    // Lógica para repartir las cartas
    setState(() {
      jugador1.repartir();
      jugador2.repartir();
    });

  }

void _verificar(int numeroJugador) {
    // Lógica para verificar las cartas del jugador correspondiente
    String mensaje = numeroJugador == 0 ? jugador1.getGrupos() : jugador2.getGrupos();
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Resultado de la verificación"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Aceptar"),
          ),
        ], 
      )
      );

  }



  //componentes de la vista del juego, como botones para repartir y verificar cartas, y un TabBar para cambiar entre los jugadores.
  @override
  Widget build(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Juego de Cartas'),
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Martin Estrada Contreras'),
            Tab(text: 'Raul Vidal'),
          ],
        ),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                  ElevatedButton(
                    onPressed: _repartir,
                    child: const Text("Repartir"),
                  ),
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          _verificar(DefaultTabController.of(context).index);
                        },
                        child: const Text("Verificar"),
                      );
                    },
                  ),
                ],
            )
          ),
          Expanded(

            child: TabBarView(
              children: [
                
                PanelJugador(cartas: jugador1.cartas, colorfondo: Colors.blueAccent), // Aquí se pasarían las cartas del jugador 1
                PanelJugador(cartas: jugador2.cartas, colorfondo: Colors.lightGreen), // Aquí se pasarían las cartas del jugador 2


              ],
            ),

          )

        ],

    
    )
   )
    
  );
  }
}