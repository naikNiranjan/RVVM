import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/app_drawer.dart';

class VisitorEntryScreen extends StatelessWidget {
  const VisitorEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.person_add),
              title: Text('New Visitor Entry'),
              subtitle: Text('Add a new visitor to the system'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.group_add),
              title: Text('Group Entry'),
              subtitle: Text('Register multiple visitors'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.history),
              title: Text('Recent Entries'),
              subtitle: Text('View recently added visitors'),
            ),
          ),
        ],
      ),
    );
  }
}
