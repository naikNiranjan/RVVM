import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageCarousel extends HookConsumerWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final currentPage = useState(0);

    // List of image assets
    final images = const [
      'assets/images/college_entrance.jpg',
      'assets/images/rvce-campus.jpg',
      'assets/images/rvce-building.jpg',
    ];

    // Auto-scroll effect
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (currentPage.value < images.length - 1) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });

      return timer.cancel;
    }, []);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) => currentPage.value = index,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
          bottom: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage.value == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
