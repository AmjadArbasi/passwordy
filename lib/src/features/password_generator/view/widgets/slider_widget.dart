import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/password_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const lengthOfDivider = 50;
    final lenghtOfPassword = context.select(
      (PasswordGeneratorBloc bloc) => bloc.state.length,
    );
    return BlocBuilder<PasswordGeneratorBloc, PasswordGeneratorState>(
      builder: (context, state) {
        return Slider(
          value: lenghtOfPassword.toDouble(),
          min: 0,
          max: lengthOfDivider.toDouble(),
          inactiveColor: Colors.grey.shade400,
          divisions: lengthOfDivider,
          label: lenghtOfPassword.toDouble().toStringAsFixed(0),
          onChanged: (value) {
            context.read<PasswordGeneratorBloc>().add(
                  PasswordGeneratorNumberLengthUsed(
                    length: value.toInt(),
                  ),
                );
          },
        );
      },
    );
  }
}
