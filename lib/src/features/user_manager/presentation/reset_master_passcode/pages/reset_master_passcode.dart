import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/password_visiablity/password_visiablity.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/skeleton.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetMasterPasscode extends StatelessWidget {
  const ResetMasterPasscode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: 'resetMasterPasscodeTitlePage'.tr),
      body: SingleChildScrollView(
        child: BlocListener<ResetMasterPasscodeCubit, ResetMasterPasscodeState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == FormzSubmissionStatus.failure) {
              CustomDialogs.showDialogWaring(context, state.errorMessage);
            }
          },
          child: Container(
            margin: const EdgeInsets.all(25.0),
            child: const ResetMasterPasscodeForm(),
          ),
        ),
      ),
    );
  }
}

class ResetMasterPasscodeForm extends StatelessWidget {
  const ResetMasterPasscodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 25.0),
        ResetUsernameFormField(),
        SizedBox(height: 25.0),
        SecurityQuestionResetMasterPasscode(),
        SizedBox(height: 25.0),
        ResetMasterSecretFormField(),
        SizedBox(height: 25.0),
        Divider(thickness: 0.2),
        NewPasswordTitleResetPasscode(),
        ResetMasterPasswordFormField(),
        SizedBox(height: 25.0),
        ResetMasterConfirmPasswordFormField(),
        SizedBox(height: 50.0),
        ResetMasterPasscodeButton(),
        SizedBox(height: 25.0),
        ReturnSignInPage(),
      ],
    );
  }
}

class NewPasswordTitleResetPasscode extends StatelessWidget {
  const NewPasswordTitleResetPasscode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        'enterNewPasswordResetMasterPasscode'.tr,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class ResetMasterPasswordFormField extends StatelessWidget {
  const ResetMasterPasswordFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetMasterPasscodeCubit, ResetMasterPasscodeState>(
      builder: (context, state) {
        final isVisible = context.select(
          (PasswordVisibiltyBloc bloc) => bloc.state.isVisible,
        );
        return TextField(
          obscureText: isVisible ? false : true,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            suffixIcon: state.newPassword.value.isEmpty
                ? const Icon(Icons.disabled_visible)
                : IconButton(
                    onPressed: () {
                      context
                          .read<PasswordVisibiltyBloc>()
                          .add(const PasswordVisibitlyToggled());
                    },
                    icon: isVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
            prefixIcon: const Icon(Icons.password),
            hintText: "passwordFieldSignupPage".tr,
            labelText: 'passwordFieldSignupPage'.tr,
            errorText: state.newPassword.displayError?.text(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 25.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (password) => context
              .read<ResetMasterPasscodeCubit>()
              .newPasswordChanged(password),
        );
      },
    );
  }
}

class ResetMasterConfirmPasswordFormField extends StatelessWidget {
  const ResetMasterConfirmPasswordFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetMasterPasscodeCubit, ResetMasterPasscodeState>(
      builder: (context, state) {
        final isVisible = context.select(
          (PasswordVisibiltyBloc bloc) => bloc.state.isVisible,
        );
        return TextField(
          obscureText: isVisible ? false : true,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: const Icon(Icons.password),
            suffixIcon: state.confirmNewPassword.value.isEmpty
                ? const Icon(Icons.disabled_visible)
                : IconButton(
                    onPressed: () {
                      context
                          .read<PasswordVisibiltyBloc>()
                          .add(const PasswordVisibitlyToggled());
                    },
                    icon: isVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
            hintText: 'confirmPasswordFieldSignupPage'.tr,
            labelText: 'confirmPasswordFieldSignupPage'.tr,
            errorText: state.confirmNewPassword.displayError != null
                ? 'Passwords do not match'
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 25.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (confirmPassword) => context
              .read<ResetMasterPasscodeCubit>()
              .confirmNewPasswordhanged(confirmPassword),
        );
      },
    );
  }
}

class SecurityQuestionResetMasterPasscode extends StatelessWidget {
  const SecurityQuestionResetMasterPasscode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'securityQuestionOneSecret'.tr,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class ReturnSignInPage extends StatelessWidget {
  const ReturnSignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.offAllNamed(AppRoutes.signIn),
      child: Text(
        "resetGoToSignInPage".tr,
      ),
    );
  }
}

class ResetUsernameFormField extends StatelessWidget {
  const ResetUsernameFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetMasterPasscodeCubit, ResetMasterPasscodeState>(
      builder: (context, state) {
        return TextField(
          key: const Key('reset_username_field'),
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: const Icon(Icons.info),
            hintText: 'usermaneLabelText'.tr,
            labelText: "usermaneLabelText".tr,
            errorText:
                state.username.displayError != null ? 'invalid username' : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 25.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (username) => context
              .read<ResetMasterPasscodeCubit>()
              .usernameChanged(username),
        );
      },
    );
  }
}

class ResetMasterSecretFormField extends StatelessWidget {
  const ResetMasterSecretFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetMasterPasscodeCubit, ResetMasterPasscodeState>(
      builder: (context, state) {
        return TextField(
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: const Icon(Icons.system_security_update),
            // suffixIcon: state.secertIsCorrect
            //     ? const Icon(Icons.check, color: TAppTheme.success)
            //     : const Icon(Icons.dangerous, color: TAppTheme.red),
            hintText: 'hintLabelSecret'.tr,
            labelText: 'hintLabelSecret'.tr,
            errorText:
                state.secret.displayError != null ? 'invalid secret' : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 25.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (secret) =>
              context.read<ResetMasterPasscodeCubit>().secretChanged(secret),
        );
      },
    );
  }
}

class ResetMasterPasscodeButton extends StatelessWidget {
  const ResetMasterPasscodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetMasterPasscodeCubit, ResetMasterPasscodeState>(
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
                onPressed: state.isValid || state.secertIsCorrect
                    ? () {
                        context
                            .read<ResetMasterPasscodeCubit>()
                            .resetMasterPasscodeSubmitted();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                child: Text('resetMasterPasscodeButton'.tr),
              );
      },
    );
  }
}
