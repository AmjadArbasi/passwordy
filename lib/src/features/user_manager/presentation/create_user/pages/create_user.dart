// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_application_passmanager/src/core/constants/constants.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/password_visiablity/password_visiablity.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/bone/widgets/custom_appbar.dart';

class CreateUser extends StatelessWidget {
  const CreateUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: "nameOfSignUpPage".tr,
        color: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "headTextSignUpPage".tr,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateUserCubit, CreateUserState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Success'),
                content: Text(
                    'Hello, ${state.username.value} enjoy using our app and keep you passwords save'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
        }
      },
      child: const Column(
        children: [
          SignUpUsernameFormField(),
          SizedBox(height: 20),
          SignUpPasswordFormField(),
          SizedBox(height: 20),
          SignUpConfirmPasswordFormField(),
          SizedBox(height: 25),
          DropMenuSecurityQuestions(),
          SizedBox(height: 25),
          SignUpSecretFormField(),
          SizedBox(height: 25),
          SignUpLoginButton(),
          SizedBox(height: 25),
          SignInWithRegisterdAccount(),
        ],
      ),
    );
  }
}

class SignInWithRegisterdAccount extends StatelessWidget {
  const SignInWithRegisterdAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'messageHavingAnAccountSignUp'.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () => Get.offAllNamed(AppRoutes.signIn),
          child: Text(
            "buttonSignInSignUpPage".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

class SignUpUsernameFormField extends StatelessWidget {
  const SignUpUsernameFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserCubit, CreateUserState>(
      builder: (context, state) {
        return TextField(
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: const Icon(Icons.info),
            hintText: 'usernameFieldSignUpPage'.tr,
            labelText: "usernameFieldSignUpPage".tr,
            errorText:
                state.username.displayError != null ? 'invalid Username' : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 25.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (username) =>
              context.read<CreateUserCubit>().usernameChanged(username),
        );
      },
    );
  }
}

class SignUpPasswordFormField extends StatelessWidget {
  const SignUpPasswordFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserCubit, CreateUserState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        final isVisible = context.select(
          (PasswordVisibiltyBloc bloc) => bloc.state.isVisible,
        );
        return TextField(
          obscureText: isVisible ? false : true,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            suffixIcon: state.password.value.isEmpty
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
            errorText: state.password.displayError?.text(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 25.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (password) =>
              context.read<CreateUserCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class SignUpConfirmPasswordFormField extends StatelessWidget {
  const SignUpConfirmPasswordFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserCubit, CreateUserState>(
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
            suffixIcon: state.password.value.isEmpty
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
            errorText: state.confirmPassword.displayError != null
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
              .read<CreateUserCubit>()
              .confirmPasswordChanged(confirmPassword),
        );
      },
    );
  }
}

class SignUpSecretFormField extends StatelessWidget {
  const SignUpSecretFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserCubit, CreateUserState>(
      builder: (context, state) {
        return TextField(
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: const Icon(Icons.system_security_update),
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
              context.read<CreateUserCubit>().secretChanged(secret),
        );
      },
    );
  }
}

class SignUpLoginButton extends StatelessWidget {
  const SignUpLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserCubit, CreateUserState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? Center(
                child: Lottie.asset(
                  'assets/lottie/loading_1.json',
                  width: 150,
                  height: 150,
                ),
              )
            : ElevatedButton(
                onPressed: state.isValid
                    ? () {
                        context.read<CreateUserCubit>().signUpFormSubmitted();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                child: Text('buttonSignUpSignUpPage'.tr),
              );
      },
    );
  }
}
