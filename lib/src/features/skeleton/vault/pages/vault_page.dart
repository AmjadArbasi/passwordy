import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/skeleton/skeleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Vault extends StatelessWidget {
  const Vault({super.key});

  @override
  Widget build(BuildContext context) {
    return const VaultView();
  }
}

class VaultView extends StatelessWidget {
  const VaultView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchedCatchwords =
        context.select((CatchwordBloc bloc) => bloc.state.searchedCatchwords);
    final filteredCategories =
        context.select((CatchwordBloc bloc) => bloc.state.filteredCategories);
    final allCategories =
        context.select((CatchwordBloc bloc) => bloc.state.categories);
    final currentIndex =
        context.select((CatchwordBloc bloc) => bloc.state.currentIndex);

    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const CustomSearchField(),
          Row(
            children: [
              CategoryAllSelection(
                allCategories: allCategories,
                currentIndex: currentIndex,
              ),
              const Expanded(child: CategoryScrollSelection()),
            ],
          ),
          const SizedBox(height: 25),
          Expanded(
              child: CatchwordCard(
                  categories: searchedCatchwords ?? filteredCategories)),
        ],
      ),
    );
  }
}
