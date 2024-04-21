import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 6,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/user_icon.png'),
                radius: 45,
              ),
            ),
            Text(
              state.userEntity.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              state.userEntity.email ?? '',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
            ),
          ],
        );
      },
    );
  }
}