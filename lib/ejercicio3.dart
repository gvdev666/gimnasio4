import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
class EjercicioPage3 extends StatefulWidget {
  @override
  _EjercicioPage3State createState() => _EjercicioPage3State();
}

class _EjercicioPage3State extends State<EjercicioPage3> {
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
            imageUrl: 'https://i.pinimg.com/originals/93/05/a9/9305a95ff392ee686c586b7114bc1aa3.gif',
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
