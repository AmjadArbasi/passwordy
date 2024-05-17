import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/skeleton.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UserDeletion extends StatelessWidget {
  const UserDeletion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'titleUserDeletion'.tr),
      body: Container(
        margin: const EdgeInsets.all(25.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            const UserInfoView(),
            const SizedBox(height: 35.0),
            Text(
              "messageDeletiongText".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(height: 50.0),
            const CustomDeleteButton(),
          ],
        ),
      ),
    );
  }
}

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('titleShowDialogUserDeletion'.tr),
              content: Text("messageShowDialogUserDeletion".tr),
              actions: <Widget>[
                TextButton(
                  child: Text('showDialogClose'.tr),
                  onPressed: () {
                    Get.back();
                  },
                ),
                TextButton(
                  child: Text(
                    'userDeletionText'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: TAppTheme.red),
                  ),
                  onPressed: () {
                    context
                        .read<UserRequestDeletionCubit>()
                        .deleteUserAccountReqeusted();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            border: Border.symmetric(
          horizontal: BorderSide(width: 0.1),
        )),
        child: Text(
          "userDeletionText".tr,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: TAppTheme.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
