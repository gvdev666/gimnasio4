import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
class EjercicioPage extends StatefulWidget {
  @override
  _EjercicioPageState createState() => _EjercicioPageState();
}

class _EjercicioPageState extends State<EjercicioPage> {
  int _timerSeconds = 40;
  bool _timerActive = false;

  void _startTimer() {
    setState(() {
      _timerSeconds = 40;
      _timerActive = true;
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timerSeconds--;

        if (_timerSeconds == 0) {
          _timerActive = false;
          timer.cancel();
          showToast();
        }
      });
    });
  }

  void showToast() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('¡Ejercicio completado!'),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://www.canalgif.net/Gifs-animados/Deportes/Abdominales/Imagen-animada-Abdominales-03.gif',
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.75,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: _timerActive ? null : _startTimer,
                child: Text(_timerActive ? '$_timerSeconds' : 'Iniciar Ejercicio'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
