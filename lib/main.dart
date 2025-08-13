import 'package:digital_hub_news_app_task/feature/home/data/news_api_service.dart';
import 'package:digital_hub_news_app_task/feature/home/data/news_repository.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_bloc.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_event.dart';
import 'package:digital_hub_news_app_task/feature/splash/presention/splash_screen.dart';
import 'package:digital_hub_news_app_task/feature/onboarding/logic/onboarding_controller.dart';
import 'package:digital_hub_news_app_task/feature/auth/logic/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => NewsBloc(
                repository: NewsRepository(apiService: NewsApiService()),
              )..add(FetchNews(category: 'all')),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          initialBinding: BindingsBuilder(() {
            Get.put(OnboardingController());
            Get.put(AuthController());
          }),
        );
      },
      child: const SplashScreen(),
    );
  }
}
