import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/auth/bloc/auth_bloc.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/password_visiablity/bloc/password_visibilty_bloc.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/bone/bone.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SignIn());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: Colors.transparent,
        title: "SignInTitle".tr,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            Logger().f(state.status);
          },
          child: Container(
            margin: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "WelcomeBack".tr,
                    style: Theme.of(context).textTheme.headlineSmall!,
                  ),
                ),
                const SizedBox(height: 40.0),
                const SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignInCubit, SignInState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status.isFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.signInErrorMessage),
                  ),
                );
            }
          },
        ),
      ],
      child: const Column(
        children: [
          SigninUsernameFormField(),
          SizedBox(height: 25),
          SigninPasswordFormField(),
          SizedBox(height: 25),
          ResetForgotPasswordButton(),
          SizedBox(height: 25),
          SigninLoginButton(),
          SizedBox(height: 25),
          RegisterNewUser(),
        ],
      ),
    );
  }
}

class ResetForgotPasswordButton extends StatelessWidget {
  const ResetForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.toNamed(AppRoutes.resetPassword),
      child: Text(
        "resetPasswordMessageAndButton".tr,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}

class RegisterNewUser extends StatelessWidget {
  const RegisterNewUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "DontHaveAnAccountMessage".tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () => Get.offAllNamed(AppRoutes.signUp),
          child: Text(
            'SubmitSignUpButton'.tr,
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

class SigninUsernameFormField extends StatelessWidget {
  const SigninUsernameFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_email_field'),
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
          onChanged: (username) =>
              context.read<SignInCubit>().usernameChanged(username),
        );
      },
    );
  }
}

class SigninPasswordFormField extends StatelessWidget {
  const SigninPasswordFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        final isVisible = context.select(
          (PasswordVisibiltyBloc bloc) => bloc.state.isVisible,
        );
        return TextField(
          key: const Key('loginForm_password_field'),
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
            hintText: 'PasswordHintText'.tr,
            labelText: 'PasswordLabelText'.tr,
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
              context.read<SignInCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class SigninLoginButton extends StatelessWidget {
  const SigninLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
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
                key: const Key('loginForm_elevatedButton'),
                onPressed: state.isValid
                    ? () {
                        context.read<SignInCubit>().signInWithCredentials();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                child: Text('SubmitSignInButton'.tr),
              );
      },
    );
  }
}
