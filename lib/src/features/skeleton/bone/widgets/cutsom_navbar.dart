import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/skeleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GNav(
          curve: Curves.decelerate,
          color: Colors.grey[600],
          activeColor: Theme.of(context).colorScheme.tertiary,
          tabBackgroundColor: Colors.grey.shade50,
          padding: const EdgeInsets.all(16),
          iconSize: 33,
          gap: 4,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "skeletonTitlesHome".tr,
            ),
            GButton(
              icon: Icons.lock,
              text: "skeletonTitlesVault".tr,
            ),
            GButton(
              icon: Icons.person,
              text: "skeletonTitlesProfile".tr,
            ),
          ],
          onTabChange: (index) {
            switch (index) {
              case 0:
                context
                    .read<NavigatorPageCubit>()
                    .setTab(NavigatorPageTab.home);
              case 1:
                context
                    .read<NavigatorPageCubit>()
                    .setTab(NavigatorPageTab.vault);
              case 2:
                context
                    .read<NavigatorPageCubit>()
                    .setTab(NavigatorPageTab.profile);
            }
          },
        ),
      ),
    );
  }
}
