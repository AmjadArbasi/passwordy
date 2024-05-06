import 'package:flutter_application_passmanager/src/core/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'onboarding_controller.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        skipStyle: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 20),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        onChange: (val) {},
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(
          Icons.arrow_forward,
          size: 35,
        ),
        done: const Text(
          'Done',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
        onDone: () => Get.toNamed(AppRoutes.signUp),
        nextStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          activeSize: const Size(30.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        pages: [
          PageViewModel(
            title: "Title of orange text and bold page",
            body:
                "This is a description on a page with an orange title and bold, big body.",
            image: const Center(
              child: Image(image: AssetImage('assets/images/onboarding-1.png')),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.amber,
              ),
              bodyTextStyle:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: const Column(
              children: [
                Text(
                  'Your Personal Habit Manager',
                ),
                SizedBox(height: 20),
                Image(
                  image: AssetImage('assets/images/onboarding-2.png'),
                ),
              ],
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: const Column(
              children: [
                Text(
                  'Your Personal Habit Manager',
                ),
                SizedBox(height: 20),
                Image(image: AssetImage('assets/images/onboarding-3.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
