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
      title: 'Autenticación por huella',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> _authenticate() async {
    bool isAuthenticated = false;

    try {
      isAuthenticated = await _auth.authenticate(
        localizedReason: 'Por favor, autentique para iniciar sesión',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } catch (e) {
      print(e);
    }

    return isAuthenticated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(''),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://i.pinimg.com/originals/42/9d/63/429d631659a11a9eb666b103d811470a.jpg'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      hintText: 'Ingresa tu correo electrónico',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      hintText: 'Ingresa tu contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                   onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IntroScreen()),
            );
          },
                    child: Text('Ingresar'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
