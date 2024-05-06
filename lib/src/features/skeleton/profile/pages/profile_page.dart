import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const UserInfoView(),
            const SizedBox(height: 20),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return CustomTileProfile(
                  leadIcon: Icons.help,
                  title: "generalInfoProfile".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.general, arguments: {
                      "user": state.userLocalEntity,
                    });
                  },
                );
              },
            ),
            CustomTileProfile(
              leadIcon: Icons.view_timeline,
              title: "activityProfile".tr,
              onTap: () {
                Get.toNamed(AppRoutes.activitiesLog);
              },
            ),
            CustomTileProfile(
              leadIcon: Icons.health_and_safety,
              title: "aboutProfile".tr,
              onTap: () {
                Get.toNamed(AppRoutes.about);
              },
            ),
            CustomTileProfile(
              leadIcon: Icons.language,
              title: "langProfile".tr,
              onTap: () => Get.toNamed(AppRoutes.translator),
            ),
            // CustomTileProfile(
            //   leadIcon: Icons.new_releases,
            //   title: "versionProfile".tr,
            //   onTap: () {},
            // ),
            const SizedBox(height: 25),
            Builder(
              builder: (context) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<AuthBloc>()
                          .add(const AuthUserLogoutRequested());
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 40,
                      color: TAppTheme.red,
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'LogoutProfile'.tr,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
