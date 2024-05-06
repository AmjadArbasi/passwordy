import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
          LastUnsuccessfulDateTime(),
          HomeCategoryBar(),
          CategoryScrollView(),
          HomeCatchwordBar(),
          RecentlyCatchwordsUsed(),
        ],
      ),
    );
  }
}

class RecentlyCatchwordsUsed extends StatelessWidget {
  const RecentlyCatchwordsUsed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final recentlyUsedCatchwords = context
        .select((CatchwordBloc bloc) => bloc.state.recentlyUsedCatchwords);

    return Expanded(child: CatchwordCard(categories: recentlyUsedCatchwords));
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
          const SizedBox(width: 6.0),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Row(
                children: [
                  Text(
                    "welcomeMessageHomePage".tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${state.userLocalEntity.displayName}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
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
                'lastSuccessfulSignInHomePage'.tr,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text('${state.userLocalEntity.lastSuccessfulSignIn}'),
            ],
          ),
        );
      },
    );
  }
}

class LastUnsuccessfulDateTime extends StatelessWidget {
  const LastUnsuccessfulDateTime({
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
                'lastUnsuccessfulSignInHomePage'.tr,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text('${state.userLocalEntity.lastUnsuccessfulSignIn}'),
            ],
          ),
        );
      },
    );
  }
}
