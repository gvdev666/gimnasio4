import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
class EjercicioPage4 extends StatefulWidget {
  @override
  _EjercicioPage4State createState() => _EjercicioPage4State();
}

class _EjercicioPage4State extends State<EjercicioPage4> {
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
            imageUrl: 'https://4.bp.blogspot.com/-ptBaw-p-bdQ/WobjEDkPcpI/AAAAAAAAa_I/1AmAuo8JYBg8PWhR5xxabYmZHRa97A8sQCLcBGAs/s1600/step%2Bby%2Bstep%2Bexercises%2Bboxeo%2Bde%2Bsombra.gif',
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
