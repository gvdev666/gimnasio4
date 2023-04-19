import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'ejercicio1.dart';
import 'ejercicio2.dart';
import 'ejercicio3.dart';
import 'ejercicio4.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Ejercicios'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EjercicioPage()),
                );
              },
              child: Text('Ir a Abdominales'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EjercicioPage2()),
                );
              },
              child: Text('Tijeras'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EjercicioPage3()),
                );
              },
              child: Text('Sentadillas'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EjercicioPage4()),
                );
              },
              child: Text('Golpes'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 1'),
      ),
      body: Center(
        child: Text('Esta es la pantalla 1'),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 2'),
      ),
      body: Center(
        child: Text('Esta es la pantalla 2'),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 3'),
      ),
      body: Center(
        child: Text('Esta es la pantalla 3'),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 4'),
      ),
      body: Center(
        child: Text('Esta es la pantalla 4'),
      ),
    );
  }
}
