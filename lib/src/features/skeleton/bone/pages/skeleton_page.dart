import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/constants/constants.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  void initState() {
    GlobalVar.logger.f("subscribe");
    context.read<CatchwordBloc>().add(const CatchwordsSubscriptionRequested());
    context.read<ManageCategoryBloc>().add(const ManageCategorySubscribed());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SkeletonView();
  }
}

class SkeletonView extends StatelessWidget {
  const SkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select(
      (NavigatorPageCubit cubit) => cubit.state.tab,
    );
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
