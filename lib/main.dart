import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'intro1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticationPage(),
    );
  }
}

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  String _authorized = 'Not authorized';

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Escanea tu huella para acceder',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } catch (e) {
      print(e);
    }
    setState(() {
      _authorized = authenticated ? 'Autorizado' : 'No autorizado';
    });
    if (authenticated) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntroScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autenticacion Biometrica'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Tu estas $_authorized para usar la app.'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Autenticar'),
              onPressed: _authenticate,
            ),
          ],
        ),
      ),
    );
  }
}
