import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/password_visiablity/password_visiablity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCardInfo extends StatelessWidget {
  const CustomCardInfo({
    super.key,
    required this.content,
    required this.title,
    this.isPassword = false,
    required this.catchwordEntity,
    required this.categoryEntity,
  });

  final String content;
  final String title;
  final bool isPassword;
  final CatchwordEntity catchwordEntity;
  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    final isVisible =
        context.select((PasswordVisibiltyBloc bloc) => bloc.state.isVisible);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    context
                        .read<CatchwordBloc>()
                        .add(CatchwordsValueCopied(value: content));
                  },
                  child: Text(
                    isPassword
                        ? isVisible
                            ? content.isEmpty
                                ? ''
                                : '********'
                            : content
                        : content,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            isPassword
                ? content.isEmpty
                    ? const Icon(Icons.disabled_visible)
                    : BlocProvider(
                        create: (context) => PasswordVisibiltyBloc(false),
                        child: IconButton(
                          onPressed: () {
                            BlocProvider.of<PasswordVisibiltyBloc>(context).add(
                              const PasswordVisibitlyToggled(),
                            );
                          },
                          icon: Icon(
                            isVisible ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      )
                : const Text(''),
            IconButton(
                onPressed: () {
                  context
                      .read<CatchwordBloc>()
                      .add(CatchwordsValueCopied(value: content));
                },
                icon: Icon(
                  Icons.copy,
                  color: Theme.of(context).colorScheme.secondary,
                )),
          ],
        ),
      ),
    );
  }
}
