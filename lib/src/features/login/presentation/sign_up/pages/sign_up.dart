import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_application_passmanager/src/features/password_visiablity/password_visiablity.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/bone/widgets/custom_appbar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:
          CustomAppBar(title: "nameOfSignUpPage".tr, color: Colors.transparent),
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
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Get.back();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('errorMessageSignUpPage'.tr),
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
          SignUpLoginButton(),
        ],
      ),
    );
  }
}

class SignUpUsernameFormField extends StatelessWidget {
  const SignUpUsernameFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
              context.read<SignUpCubit>().usernameChanged(username),
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
    return BlocBuilder<SignUpCubit, SignUpState>(
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
              context.read<SignUpCubit>().passwordChanged(password),
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final isVisible = context.select(
          (PasswordVisibiltyBloc bloc) => bloc.state.isVisible,
        );
        return TextField(
          obscureText: isVisible ? false : true,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: const Icon(Icons.security),
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
              .read<SignUpCubit>()
              .confirmPasswordChanged(confirmPassword),
        );
      },
    );
  }
}

class SignUpLoginButton extends StatelessWidget {
  const SignUpLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
                        context.read<SignUpCubit>().signUpFormSubmitted();
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
