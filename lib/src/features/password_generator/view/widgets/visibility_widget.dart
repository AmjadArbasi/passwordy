import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/password_visiablity/password_visiablity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityWidget extends StatelessWidget {
  const VisibilityWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFF0080),
        borderRadius: BorderRadius.circular(100),
      ),
      child: BlocBuilder<PasswordVisibiltyBloc, PasswordVisibiltyState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              context
                  .read<PasswordVisibiltyBloc>()
                  .add(const PasswordVisibitlyToggled());
            },
            icon: Icon(
              state.isVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
