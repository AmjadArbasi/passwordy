import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class UpdateUserInfoForm extends StatelessWidget {
  const UpdateUserInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UsernameChangedField(),
          SizedBox(height: 25),
          NewPasswordChangedField(),
          SizedBox(height: 25),
          SecretChangedField(),
          SizedBox(height: 25),
          CurrentPasswordChangedField(),
          SizedBox(height: 25),
          UpdateUserInfoSubmitted(),
        ],
      ),
    );
  }
}

class UpdateUserInfoSubmitted extends StatelessWidget {
  const UpdateUserInfoSubmitted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserUpdateInfoCubit, UserUpdateInfoState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? Center(
                child: Lottie.asset(
                  'assets/lottie/loading_1.json',
                  width: 50,
                  height: 50,
                ),
              )
            : ElevatedButton(
                key: const Key('lUpdateUserInfoForm_elevatedButton'),
                onPressed: state.isValid
                    ? () {
                        context
                            .read<UserUpdateInfoCubit>()
                            .updateUserInfoSubmitted();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                child: const Text('Save Changes'),
              );
      },
    );
  }
}

class SecretChangedField extends StatelessWidget {
  const SecretChangedField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserUpdateInfoCubit, UserUpdateInfoState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: "Secret",
            border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (secret) =>
              context.read<UserUpdateInfoCubit>().secretChanged(secret),
        );
      },
    );
  }
}

class CurrentPasswordChangedField extends StatelessWidget {
  const CurrentPasswordChangedField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserUpdateInfoCubit, UserUpdateInfoState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: "Current Password",
            border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (currentPassword) => context
              .read<UserUpdateInfoCubit>()
              .currentPasswordChecked(currentPassword),
        );
      },
    );
  }
}

class NewPasswordChangedField extends StatelessWidget {
  const NewPasswordChangedField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserUpdateInfoCubit, UserUpdateInfoState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: "New Password",
            border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (newPassword) => context
              .read<UserUpdateInfoCubit>()
              .newPasswordChanged(newPassword),
        );
      },
    );
  }
}

class UsernameChangedField extends StatelessWidget {
  const UsernameChangedField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserUpdateInfoCubit, UserUpdateInfoState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: "displayNameGeneral".tr,
            border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (username) =>
              context.read<UserUpdateInfoCubit>().usernameChanged(username),
        );
      },
    );
  }
}
