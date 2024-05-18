import 'package:flutter/cupertino.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(), // Başlangıç ekranı ana menü olacak
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brick Breaker'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"), // Arkaplan fotoğrafı burada ekleniyor
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
            child: Text('Başla', style: TextStyle(fontSize: 24,color: Color(0xFF36a652),)),
          ),
        ),
      ),
    );
  }
}
