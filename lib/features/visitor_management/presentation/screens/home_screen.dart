import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/image_carousel.dart';
import '../widgets/app_drawer.dart';
import 'quick_checkin_screen.dart';
import 'cab_entry_screen.dart';
import 'approval_status_screen.dart';
import 'todays_visitors_screen.dart';
import 'document_screen.dart';
import 'register_screen.dart';

class VisitorManagementScreen extends ConsumerWidget {
  const VisitorManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImageCarousel(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.05,
                children: [
                  DashboardCard(
                    title: 'Quick Check-In',
                    subtitle: 'Fast track visitor entry',
                    icon: Icons.flash_on,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuickCheckInScreen(),
                      ),
                    ),
                  ),
                  DashboardCard(
                    title: 'Register',
                    subtitle: 'New visitor entry',
                    icon: Icons.person_add,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    ),
                  ),
                  DashboardCard(
                    title: 'Cab Entry',
                    subtitle: 'Register campus cabs',
                    icon: Icons.local_taxi,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CabEntryScreen(),
                      ),
                    ),
                  ),
                  DashboardCard(
                    title: 'Approval Status',
                    subtitle: 'View pending requests',
                    icon: Icons.access_time,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ApprovalStatusScreen(),
                      ),
                    ),
                  ),
                  DashboardCard(
                    title: "Today's Visitors",
                    subtitle: 'View active visitors',
                    icon: Icons.people,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TodaysVisitorsScreen(),
                      ),
                    ),
                  ),
                  DashboardCard(
                    title: 'Document',
                    subtitle: 'See All Documents',
                    icon: Icons.document_scanner,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DocumentScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
