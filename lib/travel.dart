import 'package:flutter/material.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Section'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Travel sxdgsf Section!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
