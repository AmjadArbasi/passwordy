import 'package:flutter_application_passmanager/src/core/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          skip: Text(
            'onboardingSkip'.tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
            ),
          ),
          next: Icon(
            Icons.arrow_forward,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
          done: Text(
            'onboardingDone'.tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
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
            activeColor: Theme.of(context).colorScheme.primary,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          pages: [
            PageViewModel(
              title: "page1Titile".tr,
              bodyWidget: Column(
                children: [
                  const Image(
                      image: AssetImage('assets/images/onboarding-1.png')),
                  const SizedBox(height: 25),
                  Text(
                    "page1paragraph".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        height: 1.8,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              decoration: const PageDecoration(safeArea: 10),
            ),
            PageViewModel(
              title: "page2Titile".tr,
              bodyWidget: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/onboarding-2.png'),
                  ),
                  const SizedBox(height: 25),

                  Text(
                    "page2paragraph".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        height: 1.8,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  // SizedBox(height: 20),
                ],
              ),
            ),
            PageViewModel(
              title: "page3Titile".tr,
              // body: ,
              bodyWidget: Column(
                children: [
                  const Image(
                      image: AssetImage('assets/images/onboarding-3.png')),
                  const SizedBox(height: 25),
                  Text(
                    "page3paragraph".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        height: 1.8,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
            PageViewModel(
              title: "page4Titile".tr,
              bodyWidget: Column(
                children: [
                  const Image(
                      image: AssetImage('assets/images/onboarding-4.jpg')),
                  const SizedBox(height: 25),
                  Text(
                    'page4paragraph'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        height: 1.8,
                        color: Theme.of(context).colorScheme.secondary),
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
