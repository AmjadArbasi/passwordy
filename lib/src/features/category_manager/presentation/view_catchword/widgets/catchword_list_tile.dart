import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CatchwordListTile extends StatelessWidget {
  const CatchwordListTile({
    super.key,
    required this.catchword,
    required this.category,
  });

  final CatchwordEntity catchword;
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
      leading: CircleAvatar(
        radius: 45,
        child: catchword.name.isEmpty
            ? const Icon(Icons.error)
            : Text(catchword.name[0].capitalize.toString()),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(catchword.name),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(catchword.accountId),
          catchword.passcode.isEmpty
              ? const Text('')
              : catchword.isVisible
                  ? Text(catchword.passcode)
                  : const Text("********"),
        ],
      ),
      trailing: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 50,
          maxWidth: 100,
          minHeight: 1,
          minWidth: 1,
        ),
        child: Row(
          children: [
            Expanded(
              child: catchword.passcode.isEmpty
                  ? const Text('')
                  : IconButton(
                      onPressed: () {
                        context.read<CatchwordBloc>().add(
                              CatchwordsCopyPressed(
                                copiedPasscode: catchword.passcode,
                              ),
                            );
                      },
                      icon: const Icon(Icons.copy),
                    ),
            ),
            Expanded(
              child: catchword.passcode.isEmpty
                  ? const Icon(Icons.disabled_visible)
                  : IconButton(
                      onPressed: () {
                        BlocProvider.of<CatchwordBloc>(context).add(
                          CatchwordsPasswordVisibilityToggled(
                            catchwordEntity: catchword,
                            categoryEntity: category,
                          ),
                        );
                      },
                      icon: Icon(
                        catchword.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
