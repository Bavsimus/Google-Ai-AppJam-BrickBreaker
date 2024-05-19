import 'package:flutter/material.dart';
import 'dart:async';
import 'brickgame.dart';

void main() {
  runApp(BrickBreakerApp());
}

class BrickBreakerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brick Breaker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // MD3 renk şeması
        useMaterial3: true, // MD3'ü etkinleştirmek için
      ),
      home: LoginScreen(), // Başlangıç ekranı giriş ekranı olacak
    );
  }
}

// Giriş ekranı
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == 'test@example.com' && password == 'password') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainMenu()),
      );
    } else {
      // Hatalı giriş mesajı
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hatalı Giriş'),
          content: Text('Geçersiz e-posta veya şifre.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        ),
      );
    }
  }

  void _forgotPassword() {
    // Şifre sıfırlama işlemleri burada yapılabilir
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Şifremi Unuttum'),
        content: Text('Şifre sıfırlama bağlantısı gönderildi.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _createAccount() {
    // Hesap oluşturma işlemleri burada yapılabilir
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hesap Oluştur'),
        content: Text('Hesap oluşturma sayfasına yönlendiriliyorsunuz.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Tamam'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background2.png'), // Giriş ekranı arka plan fotoğrafı
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'E-posta',
                      border: OutlineInputBorder(), // MD3 stiline uygun
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      border: OutlineInputBorder(), // MD3 stiline uygun
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Giriş Yap'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16), // MD3 stiline uygun
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _createAccount,
                      child: Text('Hesap Oluştur'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16), // MD3 stiline uygun
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _forgotPassword,
                      child: Text('Şifremi Unuttum'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16), // MD3 stiline uygun
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

// Ana menü ekranı
class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"), // Ana menü arka plan fotoğrafı
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BrickBreakerGame()),
              );
            },
            child: Text(
              'Başla',
              style: TextStyle(fontSize: 24, color: Color(0xFF36a652)),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16), // MD3 stiline uygun
            ),
          ),
        ),
      ),
    );
  }
}
