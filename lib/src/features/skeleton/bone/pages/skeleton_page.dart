import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

const List<Widget> pages = [
  Home(),
  Vault(),
  Profile(),
];

const List<String> titles = [
  'skeletonTitlesHome',
  'skeletonTitlesVault',
  'skeletonTitlesProfile',
];

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  static Page<void> page() => GetPage(
        name: AppRoutes.skeleton,
        page: () => const Skeleton(),
        binding: TranslatorBindings(),
      );

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((NavigatorPageCubit cubit) => cubit.state.tab);
    Logger().f(selectedTab);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(title: titles[selectedTab.index].tr),
        body: pages[selectedTab.index],
        floatingActionButton: selectedTab == NavigatorPageTab.vault
            ? const CustomVaultFloatingActionButton()
            : null,
        bottomNavigationBar: const CustomNavbar(),
      ),
    );
  }
}
