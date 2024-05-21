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
          // ListTileTextFieldPassword(
          //   catchword: catchword,
          //   password: catchword.passcode,
          // ),
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
                        context.read<CatchwordBloc>().add(CatchwordsCopyPressed(
                            copiedPasscode: catchword.passcode,
                            catchwordId: catchword.id!));
                        context
                            .read<CatchwordBloc>()
                            .add(CatchwordsUsingTrigger(id: catchword.id!));
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
                                categoryEntity: category));
                        context
                            .read<CatchwordBloc>()
                            .add(CatchwordsUsingTrigger(id: catchword.id!));
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
//TODO: To be deleting later
// class ListTileTextFieldPassword extends StatefulWidget {
//   const ListTileTextFieldPassword({
//     super.key,
//     required this.catchword,
//     required this.password,
//   });

//   final CatchwordEntity catchword;
//   final String password;

//   @override
//   State<ListTileTextFieldPassword> createState() =>
//       _ListTileTextFieldPasswordState();
// }

// class _ListTileTextFieldPasswordState extends State<ListTileTextFieldPassword> {
//   late TextEditingController textEditingController;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: textEditingController,
//       decoration: const InputDecoration(border: InputBorder.none),
//       obscureText: widget.catchword.isVisible,
//       readOnly: true,
//     );
//   }

//   @override
//   void initState() {
//     textEditingController = TextEditingController(text: widget.password);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     super.dispose();
//   }
// }
