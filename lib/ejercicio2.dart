import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
class EjercicioPage2 extends StatefulWidget {
  @override
  _EjercicioPage2State createState() => _EjercicioPage2State();
}

class _EjercicioPage2State extends State<EjercicioPage2> {
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
            imageUrl: 'https://static.wixstatic.com/media/e7fa63_9bd84513fb6c4264966fa5b73e968045~mv2.gif',
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
