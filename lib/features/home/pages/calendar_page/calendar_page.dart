import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/constans/colors.dart';

import 'package:primary_school/domain/repositories/calendar/events_repository.dart';
import 'package:primary_school/features/home/pages/calendar_page/add_event_dialog/add_event_dialog.dart';

import 'package:primary_school/features/home/pages/calendar_page/cubit/calendar_cubit.dart';
import 'package:primary_school/features/home/pages/calendar_page/edit_event_screen/edit_event_screen.dart';
import 'package:primary_school/features/home/pages/calendar_page/widgets/calendar_widget.dart';
import 'package:primary_school/features/home/pages/calendar_page/widgets/event_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    super.key,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Kalendarz',
          style: TextStyle(
            letterSpacing: 2,
            color: AppColors.accentColor,
          ),
        ),
        leading: IconButton(
          color: AppColors.accentColor,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: AppColors.redColor,
            ),
            padding: const EdgeInsets.only(right: 5),
            onPressed: () {
              _showDialog();
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => CalendarCubit(
          EventsRepository(),
        )..start(),
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            final eventModels = state.calendarItems;
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case Status.success:
                return ListView(
                  children: [
                    const CalendarWidget(),
                    // TextButton(
                    //     onPressed: () {
                    //       showAboutDialog(
                    //         context: context,
                    //         applicationVersion: '3.0.0',
                    //         applicationIcon: Icon(Icons.abc),
                    //         applicationLegalese: 'Blah blah',
                    //         children: [
                    //           AdditionalWi
                    //         ]
                    //       );
                    //     },
                    //     child: const Text('Info')),
                    Column(
                      children: [
                        for (final eventModel in eventModels) ...[
                          Slidable(
                            key: ValueKey(eventModel.id),
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    label: 'Usuń',
                                    icon: Icons.delete,
                                    borderRadius: BorderRadius.circular(12),
                                    spacing: 5,
                                    backgroundColor: AppColors.primaryColor,
                                    onPressed: (context) {
                                      showDialog(
                                        context: context,
                                        builder: ((context) {
                                          return AlertDialog(
                                            elevation: 20,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            title:
                                                const Text('Usunąć notatkę?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Nie',
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .secondaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<CalendarCubit>()
                                                      .remove(
                                                        documentID:
                                                            eventModel.id,
                                                      );
                                                },
                                                child: const Text(
                                                  'Tak',
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .secondaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                  SlidableAction(
                                    label: 'Edytuj',
                                    borderRadius: BorderRadius.circular(12),
                                    icon: Icons.mode_edit_outline_outlined,
                                    backgroundColor: AppColors.primaryColor,
                                    onPressed: (context) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditEventScreen(
                                                      eventModel: eventModel)));
                                    },
                                  ),
                                ]),
                            child: EventWidget(
                              eventModel: eventModel,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ],
                    )
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AddEventDialog();
        });
  }
}
