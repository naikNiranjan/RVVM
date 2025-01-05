import 'package:flutter/material.dart';

class CabEntryScreen extends StatelessWidget {
  const CabEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cab Entry'),
      ),
      body: const Center(
        child: Text('Cab Entry Screen Content'),
      ),
    );
  }
}
