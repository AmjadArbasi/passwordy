import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/constants/constants.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DropMenuSecurityQuestions extends StatelessWidget {
  const DropMenuSecurityQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    final currentQustion =
        context.select((SignUpCubit cubit) => cubit.state.securityQuestion);

    final validCurrentQuestoin = Questions.questions.indexWhere(
              (e) => e['value'] == currentQustion,
            ) !=
            -1
        ? currentQustion
        : null;

    return DropdownButton<String>(
      value: validCurrentQuestoin,
      hint: Text("selectOneSecurityQuestionSecret".tr),
      icon: const Icon(Icons.security),
      menuMaxHeight: MediaQuery.of(context).size.width * 0.4,
      items: Questions.questions
          .map<DropdownMenuItem<String>>((item) =>
              _buildDropDownMenuItem(item['display']!, item['value']!, context))
          .toList(),
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 16,
      ),
      onChanged: (String? value) {
        context.read<SignUpCubit>().securityQuestionChanged(value);
        GlobalVar.logger.f(value);
      },
    );
  }

  DropdownMenuItem<String> _buildDropDownMenuItem(
    String display,
    String value,
    BuildContext context,
  ) {
    return DropdownMenuItem<String>(
      value: value,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.end,
          children: [
            Text(
              display,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
