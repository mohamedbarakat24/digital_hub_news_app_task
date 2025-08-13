import 'package:digital_hub_news_app_task/core/constants/image_strings.dart';
import 'package:digital_hub_news_app_task/core/constants/string.dart';
import 'package:digital_hub_news_app_task/feature/auth/presentation/login_screen.dart';
import 'package:digital_hub_news_app_task/feature/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;
  final int totalPages = 3;

  final List<OnboardingPage> onboardingPages = [
    OnboardingPage(
      title: MyString.titleOnboarding,
      description: MyString.descriptionOnboarding,
      image: MyImages.onboarding1,
    ),
    OnboardingPage(
      title: MyString.titleOnboarding,
      description: MyString.descriptionOnboarding,
      image: MyImages.onboarding2,
    ),
    OnboardingPage(
      title: MyString.titleOnboarding,
      description: MyString.descriptionOnboarding,
      image: MyImages.onboarding3,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
