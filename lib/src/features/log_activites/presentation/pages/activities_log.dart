import 'package:flutter/material.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ActivitiesLog extends StatelessWidget {
  const ActivitiesLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "activitiesTitlePage".tr,
        color: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(25.0),
          child: const LogActivities(),
        ),
      ),
    );
  }
}

class LogActivities extends StatefulWidget {
  const LogActivities({
    super.key,
  });

  @override
  State<LogActivities> createState() => _LogActivitiesState();
}

class _LogActivitiesState extends State<LogActivities> {
  @override
  void initState() {
    context
        .read<LogActivitiesBloc>()
        .add(const LogActivitiesRefreshRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogActivitiesBloc, LogActivitiesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == LogActivitiesStatus.success) {
          if (state.logActivitiesEntity == null ||
              state.logActivitiesEntity!.isEmpty) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/empty.json',
                width: 150,
                height: 150,
              ),
            );
          } else {
            return LogActivitiesCard(logs: state.logActivitiesEntity!);
          }
        } else if (state.status == LogActivitiesStatus.loading) {
          return Center(
            child: Lottie.asset(
              'assets/lottie/loading_1.json',
              width: 150,
              height: 150,
            ),
          );
        } else {
          return Center(
            child: Lottie.asset(
              'assets/lottie/error.json',
              width: 150,
              height: 150,
            ),
          );
        }
      },
    );
  }
}

class LogActivitiesCard extends StatelessWidget {
  const LogActivitiesCard({super.key, required this.logs});

  final List<LogActivityEntity> logs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomScrollView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          slivers:
              logs.map((log) => _buildCatchwordSliver(log, context)).toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextButton(
            onPressed: () {
              context
                  .read<LogActivitiesBloc>()
                  .add(const LogActivitiesCleared());
            },
            child: Text(
              "activieiesClearAll".tr,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: TAppTheme.red),
            ),
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter _buildCatchwordSliver(
    LogActivityEntity log,
    BuildContext context,
  ) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  log.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              subtitle: Text(log.dateTime),
              leading: Text(
                "${IndexOperation.operation[log.operation]}".toLowerCase().tr,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              trailing: Image.asset(log.pathImage, height: 100),
            ),
          ),
        ),
      ),
    );
  }
}
