import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/bone/bone.dart';

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
        child: Text(
          "Our password manager app is designed with your security in mind, offering a simple yet robust solution for managing your passwords effortlessly."
          " We utilize the latest encryption technology to ensure that your sensitive information is securely stored and accessible only to you."
          " With features tailored for ease of use, including auto-fill and password generation,"
          " our app aims to streamline your digital life, making it safer and more convenient. "
          "Trust us to keep your credentials secure and organized, so you can focus on what matters most.",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                height: 2,
              ),
        ),
      ),
    );
  }
}
