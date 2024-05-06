import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/about/about.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/bone/bone.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'About',
        color: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "Our password manager app is designed with your security in mind, offering a simple yet robust solution for managing your passwords effortlessly."
              " We utilize the latest encryption technology to ensure that your sensitive information is securely stored and accessible only to you."
              " With features tailored for ease of use, including auto-fill and password generation,"
              " our app aims to streamline your digital life, making it safer and more convenient. "
              "Trust us to keep your credentials secure and organized, so you can focus on what matters most.",
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
          return Text(
            "Version: ${state.version}",
            style: Theme.of(context).textTheme.bodyMedium,
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
