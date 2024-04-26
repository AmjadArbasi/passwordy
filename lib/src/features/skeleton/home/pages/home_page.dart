import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          UserInfoBar(),
          LastSuccessfulDateTime(),
          HomeCategoryBar(),
          CategoryScrollView(),
          HomeCatchwordBar(),
          Expanded(child: CatchwordCard()),
        ],
      ),
    );
  }
}

class UserInfoBar extends StatelessWidget {
  const UserInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/user_icon.png'),
            radius: 30,
          ),
          const SizedBox(width: 8.0),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Text(
                'Hello, ${state.userLocalEntity.name}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LastSuccessfulDateTime extends StatelessWidget {
  const LastSuccessfulDateTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Text(
                'Last succsful login: ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('${state.userLocalEntity.lastSuccessfulSignIn}'),
            ],
          ),
        );
      },
    );
  }
}
