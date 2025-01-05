import 'package:flutter/material.dart';

class ApprovalStatusScreen extends StatelessWidget {
  const ApprovalStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Approval Status'),
      ),
      body: const Center(
        child: Text('Approval Status Screen Content'),
      ),
    );
  }
}
