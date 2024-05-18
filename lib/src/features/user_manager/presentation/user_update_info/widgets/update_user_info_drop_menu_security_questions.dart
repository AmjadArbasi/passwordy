import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/constants/constants.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UpdateUserInfoDropMenuSecurityQuestions extends StatelessWidget {
  const UpdateUserInfoDropMenuSecurityQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    final currentQustion = context
        .select((AuthBloc bloc) => bloc.state.userLocalEntity.securityQuestion);

    final validCurrentQuestoin = Questions.questions.indexWhere(
              (e) => e['value'] == currentQustion,
            ) !=
            -1
        ? currentQustion
        : null;

    final newQuestion = context
        .select((UserUpdateInfoCubit cubit) => cubit.state.securityQuestion);

    return DropdownButton<String>(
      value: newQuestion ?? validCurrentQuestoin,
      hint: Text("selectOneSecurityQuestionSecret".tr),
      icon: const Icon(Icons.security),
      menuMaxHeight: MediaQuery.of(context).size.width * 0.4,
      items: Questions.questions
          .map<DropdownMenuItem<String>>((item) => _buildDropDownMenuItem(
              item['display']!, item['value']!.tr, context))
          .toList(),
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 16,
      ),
      onChanged: (String? value) {
        context.read<UserUpdateInfoCubit>().changeSecurityQuestion(value!);
        GlobalVar.logger.f(value);
      },
    );
  }

  DropdownMenuItem<String> _buildDropDownMenuItem(
      String display, String value, BuildContext context) {
    return DropdownMenuItem<String>(
      value: value,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width * 0.7,
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.end,
          children: [
            Text(
              display.tr,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
