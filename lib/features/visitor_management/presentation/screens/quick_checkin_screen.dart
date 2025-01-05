import 'package:flutter/material.dart';

class QuickCheckInScreen extends StatelessWidget {
  const QuickCheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Check-In'),
      ),
      body: const Center(
        child: Text('Quick Check-In Screen Content'),
      ),
    );
  }
}
