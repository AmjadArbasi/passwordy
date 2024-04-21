import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegeneratePasswordWidget extends StatelessWidget {
  const RegeneratePasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final password =
        context.select((PasswordGeneratorBloc bloc) => bloc.state.password);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF00FFD4),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {
          context.read<PasswordGeneratorBloc>().add(
                PasswordGeneratorsubmitted(
                  submitPass: password,
                ),
              );
        },
        icon: const Icon(
          Icons.autorenew,
        ),
      ),
    );
  }
}
