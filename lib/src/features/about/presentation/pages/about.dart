import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/about/about.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/bone/bone.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'aboutTitlePage'.tr,
        color: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "aboutMessage".tr,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    height: 2,
                  ),
            ),
            const Spacer(),
            const VerionsOfAppAbout(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class VerionsOfAppAbout extends StatefulWidget {
  const VerionsOfAppAbout({
    super.key,
  });

  @override
  State<VerionsOfAppAbout> createState() => _VerionsOfAppAboutState();
}

class _VerionsOfAppAboutState extends State<VerionsOfAppAbout> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      builder: (context, state) {
        if (state.status == AboutStatus.loading) {
          return Text(
            "Version: Loading....",
            style: Theme.of(context).textTheme.bodyMedium,
          );
        } else if (state.status == AboutStatus.success) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "aboutVersionSuccess".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                state.version,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          );
        } else {
          return Text(
            "Version: -.-.-.-",
            style: Theme.of(context).textTheme.bodyMedium,
          );
        }
      },
    );
  }

  @override
  void initState() {
    context.read<AboutCubit>().getCurrentVersio();
    super.initState();
  }
}
