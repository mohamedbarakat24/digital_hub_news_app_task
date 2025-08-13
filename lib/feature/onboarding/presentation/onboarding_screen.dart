import 'package:digital_hub_news_app_task/feature/onboarding/presentation/widgets/bottom_nav_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/onboarding_controller.dart';
import 'widgets/onboarding_page_widget.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: controller.onboardingPages.length,
                    itemBuilder: (context, index) {
                      final page = controller.onboardingPages[index];
                      return OnboardingPageWidget(page: page);
                    },
                  ),
                ),
                BottomNavSection(controller: controller),
              ],
            );
          },
        ),
      ),
    );
  }
}
