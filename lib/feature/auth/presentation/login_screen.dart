import 'package:digital_hub_news_app_task/feature/auth/presentation/widgets/login_button.dart';
import 'package:digital_hub_news_app_task/feature/auth/presentation/widgets/login_form_section.dart';
import 'package:digital_hub_news_app_task/feature/auth/presentation/widgets/remember_me_section.dart';
import 'package:digital_hub_news_app_task/feature/auth/presentation/widgets/signup_section.dart';
import 'package:digital_hub_news_app_task/feature/auth/presentation/widgets/social_button_section.dart';
import 'package:digital_hub_news_app_task/feature/auth/presentation/widgets/welcom_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../logic/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Welcome Section
                      WelcomeSection(),

                      SizedBox(height: 40.h),

                      // Login Form
                      LoginFormSection(controller: controller),

                      // Remember Me & Forgot Password
                      RememberMeSection(controller: controller),

                      // Login Button
                      LoginButtonSection(controller: controller),

                      // Social Login Section
                      SocialButtonSection(),

                      // Sign Up Section
                      SignupSection(controller: controller),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
