import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/navigation_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'visitor_entry_screen.dart';
import 'visitor_log_screen.dart';
import 'more_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          const VisitorManagementScreen(),
          VisitorEntryScreen(),
          VisitorLogScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
